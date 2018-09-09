require "administrate/base_dashboard"

class DimSiteDashboard < ApplicationDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    dim_region: Field::BelongsTo,
    dim_projects: Field::HasMany,
    id: Field::Number,
    site_name: Field::String,
    site_code: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :site_name,
		:site_code,
		:dim_region,
    :dim_projects,
  ].freeze

  SHOW_PAGE_ATTRIBUTES = ATTRIBUTE_TYPES.keys - READ_ONLY_ATTRIBUTES

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
		:site_name,
    :site_code,
    :dim_region,
  ].freeze

  # Overwrite this method to customize how dim sites are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(dim_site)
    "#{dim_site.site_name}"
  end
end
