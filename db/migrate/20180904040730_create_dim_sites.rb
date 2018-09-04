class CreateDimSites < ActiveRecord::Migration[5.2]
	def self.up
    create_table :dim_sites do |t|
      t.string :site_name, limit: 50
      t.string :site_code, limit: 10
      t.references :dim_region, foreign_key: true

      t.timestamps
    end
  end
	def self.down
	  drop_table :dim_sites
	end
end
