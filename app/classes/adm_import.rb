class AdmImport
	extend ActiveModel::Naming
	include ActiveModel::Model
  include ActiveModel::Conversion
  include ActiveModel::Validations

	attr_accessor :file, :objname

	OPTIONS = [
		:chunk_size,
		:key_mapping,
		:col_sep,
		:row_sep,
		:comment_regexp,
		:value_converters,
		:quote_char,
		:convert_values_to_numeric
	].freeze

	def initialize(params = {}, attributes = {})
		if params.has_key?(:file)
			model_name = params['objname']
			@model = model_name.classify.constantize
			@file = params["file"]
		end if
		attributes.each { |name, value| send("#{name}=", value) }
	end

	def persisted?
	  false
	end

	def save
	  if imported_records.map(&:valid?).all?
	  	imported_records.each(&:save!)
			true
		else
			imported_records.each_with_index do |itm, indx|
				@model.errors.full_messages.each do |message|
					errors.add :base, "Row #{index+2}: #{message}"
				end
			end
			false
	  end
	end

	protected

	def imported_records
		 @imported_records ||= load_imported_records
	end

	def load_imported_records
		processed_file = open_csv_file
		processed_file.map do |line|
			if line.has_key?(:id)
				upload = @model.find_by_id(line.fetch(:id))
			else
				upload = @model.new
			end
			upload.attributes = line.to_hash unless upload.nil?
			upload
		end
	end

	def open_csv_file
	  processed_record = SmarterCSV.process(@file.path, csv_options)
		processed_record[0]
	end

	def csv_options
	  {
      :strip_chars_from_headers => /[\-"]/,
      :force_simple_split => true,
      :chunk_size => 1000,
      :remove_unmapped_keys => true,
      :verbose => true
    }
	end
end
