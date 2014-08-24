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
      configure :price do
        help 'Required. The price of the item (without pound symbol).'
      end

      configure :active do
        help 'Active can be unchecked to hide items that are no longer available (e.g. offers).'
      end

      configure :weighting do
        help 'Required. Items with higher weightings appear first.'
      end

      configure :requirements do
        help 'Optional. Length up to 255. If this item requires something (e.g. an A licence) enter it here.'
      end

      exclude_fields :versions
    end

    navigation_icon 'icon-tags'
  end
end
