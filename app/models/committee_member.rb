class CommitteeMember < ActiveRecord::Base
  validates :name, presence: true
  validates :role, presence: true
  validates :weighting, presence: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 100 }
  validates :image, presence: true

  # TOOD: Allow uploads of new committee photos

  has_paper_trail

  rails_admin do
    edit do
      field :name
      field :role

      field :weighting do
        help 'Required. People with higher weightings apear first on the page.'
      end
      
      field :image
    end
  end
end
