# == Schema Information
#
# Table name: dim_regions
#
#  id          :integer          not null, primary key
#  region_code :string(10)
#  region_name :string(50)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class DimRegion < ApplicationRecord
	has_many :dim_languages
	has_many :dim_sites
end
