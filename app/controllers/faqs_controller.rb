class FaqsController < ApplicationController
  def index()
    @faq_categories = FaqCategory.all

    id = (params[:id] or @faq_categories.first.id)

    @faq_category = @faq_categories.find(id.to_i)
  end
end
