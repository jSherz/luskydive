# Questions that provide general info about the club & sport
class Faq < ActiveRecord::Base
  belongs_to :category, class_name: 'FaqCategory', foreign_key: 'faq_category_id'

  validates :question, presence: true
  validates :answer, presence: true
  validates :weighting, presence: true
  validates :category, presence: true

  has_paper_trail

  rails_admin do
    # Don't show HTML in answer
    configure :answer do
      formatted_value do
        bindings[:view].strip_tags value
      end
    end

    list do
      field :question
      field :answer

      field :weighting do
        sort_reverse true
      end

      field :category

      sort_by :weighting
    end

    edit do
      # Override HTML tag removal when editing
      configure :answer do
        formatted_value do
          value
        end
      end

      exclude_fields :versions
    end

    navigation_icon 'icon-question-sign'
  end
end
