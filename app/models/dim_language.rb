# == Schema Information
#
# Table name: dim_languages
#
#  id            :integer          not null, primary key
#  language_code :string(5)
#  language_name :string(20)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  dim_region_id :integer
#
# Indexes
#
#  index_dim_languages_on_dim_region_id  (dim_region_id)
#

class DimLanguage < ApplicationRecord
  belongs_to :dim_region
end
