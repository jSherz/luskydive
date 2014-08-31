# Displays FAQs
class FaqsController < ApplicationController
  def index
    @faq_categories = FaqCategory.all

    @faq_category = @faq_categories.first

    @faqs = @faq_category.faqs
  end

  def show
    @faq_categories = FaqCategory.all

    @faq_category = @faq_categories.where(urlslug: params[:urlslug])[0]

    @faqs = @faq_category.faqs

    render 'index'
  end
end
