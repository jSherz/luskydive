class Faq < ActiveRecord::Base
  belongs_to :category, class_name: 'FaqCategory', foreign_key: 'faq_category_id'

  validates :question, presence: true
  validates :answer, presence: true
  validates :weighting, presence: true
  validates :category, presence: true

  has_paper_trail
end
