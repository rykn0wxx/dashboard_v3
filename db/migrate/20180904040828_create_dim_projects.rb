class CreateDimProjects < ActiveRecord::Migration[5.2]
	def self.up
    create_table :dim_projects do |t|
      t.string :project_name, limit: 100
      t.references :dim_site, foreign_key: true

      t.timestamps
    end
  end
	def self.down
	  drop_table :dim_projects
	end
end
