class Package < ActiveRecord::Base
  default_scope { where active: true }
  default_scope { order weighting: :desc }

  # TODO: Add validation
  has_paper_trail

  rails_admin do
    list do
      field :title
      field :description
      field :price
      field :active
      field :weighting
    end

    edit do
      exclude_fields :versions
    end

    navigation_icon 'icon-tags'
  end
end
