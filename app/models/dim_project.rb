# == Schema Information
#
# Table name: dim_projects
#
#  id           :integer          not null, primary key
#  project_name :string(100)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  dim_site_id  :integer
#
# Indexes
#
#  index_dim_projects_on_dim_site_id  (dim_site_id)
#

class DimProject < ApplicationRecord
  belongs_to :dim_site
end
