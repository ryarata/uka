require "administrate/base_dashboard"

class CompetitionDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    user: Field::BelongsTo,
    movie: Field::HasOne,
    category_contents: Field::HasMany,
    votes: Field::HasMany,
    competition_entries: Field::HasMany,
    content_reading: Field::HasOne,
    id: Field::Number,
    title: Field::String,
    description: Field::Text,
    apply_guideline: Field::Text,
    competition_type: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :user,
    :movie,
    :category_contents,
    :votes,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :user,
    :movie,
    :category_contents,
    :votes,
    :competition_entries,
    :content_reading,
    :id,
    :title,
    :description,
    :apply_guideline,
    :competition_type,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :user,
    :movie,
    :category_contents,
    :votes,
    :competition_entries,
    :content_reading,
    :title,
    :description,
    :apply_guideline,
    :competition_type,
  ].freeze

  # Overwrite this method to customize how competitions are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(competition)
  #   "Competition ##{competition.id}"
  # end
end
