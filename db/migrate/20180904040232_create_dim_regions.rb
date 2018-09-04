class CreateDimRegions < ActiveRecord::Migration[5.2]
	def self.up
    create_table :dim_regions do |t|
      t.string :region_name, limit: 50
      t.string :region_code, limit: 10

      t.timestamps
    end
  end
	def self.down
	  drop_table :dim_regions
	end
end
