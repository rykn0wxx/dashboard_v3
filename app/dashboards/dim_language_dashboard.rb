require "administrate/base_dashboard"

class DimLanguageDashboard < ApplicationDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    dim_region: Field::BelongsTo,
    id: Field::Number,
    language_name: Field::String,
    language_code: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :language_name,
    :language_code,
		:dim_region,
  ].freeze

  SHOW_PAGE_ATTRIBUTES = ATTRIBUTE_TYPES.keys - READ_ONLY_ATTRIBUTES

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :language_name,
    :language_code,
		:dim_region,
  ].freeze

  # Overwrite this method to customize how dim languages are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(dim_language)
    "#{dim_language.language_name}"
  end
end
