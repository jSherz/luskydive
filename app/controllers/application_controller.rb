class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index
  end

  def faqs()
    @faq_categories = FaqCategory.all

    id = (params[:id] or @faq_categories.first.id)

    @faq_category = @faq_categories.find(id.to_i)
  end
end
