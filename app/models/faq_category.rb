# FAQ categories that organise FAQ entries
class FaqCategory < ActiveRecord::Base
  has_many :faqs, class_name: 'Faq', dependent: :destroy

  validates :name, presence: true

  has_paper_trail

  rails_admin do
    list do
      field :name
      field :number_of_faqs do
        label 'No. of FAQs'

        formatted_value do
          bindings[:object].faqs.count
        end
      end
    end

    show do
      field :name

      field :faqs do
        pretty_value do
          view = bindings[:view]

          [value].flatten.select(&:present?).map do |faq|
            view.link_to(faq.question, view.url_for(action: :show, model_name: :faq, id: faq.id), class: 'pjax')
          end.to_sentence.html_safe
        end
      end
    end

    edit do
      field :name
      field :faqs
    end

    navigation_icon 'icon-list-alt'
  end
end
