class AdminImport
	extend ActiveModel::Naming
  include ActiveModel::Model
  include ActiveModel::Conversion
  include ActiveModel::Validations

	attr_accessor :file, :objname

	OPTIONS = [
    :value_converters
  ].freeze

	def initialize(attributes = {})
		attributes.each { |name, value| send("#{name}=", value) }
	end
end
