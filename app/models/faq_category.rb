class FaqCategory < ActiveRecord::Base
  has_many :faqs, class_name: 'Faq', dependent: :destroy

  validates :name, presence: true
end
