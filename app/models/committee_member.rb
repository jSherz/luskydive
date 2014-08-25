# Members of the club's committee
class CommitteeMember < ActiveRecord::Base
  default_scope { order weighting: :desc }

  validates :name, presence: true
  validates :role, presence: true
  validates :weighting, presence: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 100 }
  validates :image, presence: true

  # TOOD: Allow uploads of new committee photos

  has_paper_trail

  rails_admin do
    list do
      field :name
      field :role
      field :weighting do
        sort_reverse true
      end

      sort_by :weighting
    end

    show do
      configure :image do
        formatted_value do
          bindings[:view].tag(:img,
                              src: bindings[:view].image_path(bindings[:object].image),
                              style: 'width: 20em'
                             )
        end
      end
    end

    edit do
      field :name
      field :role
      field :weighting
      field :image
    end

    navigation_icon 'icon-user'
  end
end
