class CreateDimLanguages < ActiveRecord::Migration[5.2]
  def self.up
    create_table :dim_languages do |t|
      t.string :language_name, limit: 20
      t.string :language_code, limit: 5
      t.references :dim_region, foreign_key: true

      t.timestamps
    end
  end
	def self.down
	  drop_table :dim_languages
	end
end
