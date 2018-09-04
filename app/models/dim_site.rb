# == Schema Information
#
# Table name: dim_sites
#
#  id            :integer          not null, primary key
#  site_code     :string(10)
#  site_name     :string(50)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  dim_region_id :integer
#
# Indexes
#
#  index_dim_sites_on_dim_region_id  (dim_region_id)
#

class DimSite < ApplicationRecord
	belongs_to :dim_region
	has_many :dim_projects
end
