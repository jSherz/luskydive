class FaqsController < ApplicationController
  def index
    @faq_categories = FaqCategory.all

    id = params[:id] || @faq_categories.first.id

    @faq_category = @faq_categories.find id
  end
end
