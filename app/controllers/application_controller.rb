class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index
  end

  def events
    # TODO: Replace with dynamic auth string & group ID
    graph = Koala::Facebook::API.new('CAACEdEose0cBAAn75NbLjaRwyganFmxDp35Aeoqp44vAMZBDlEpkV9JNgtJLolkENvWHaikG8xeClZC6h7bGLNwt6nU3eMvpxxvMNiAkcvP8rxgUeFaAerxWE0BaDDhFkdZBddQ8Vb4QARzN1vWhiLfuJAZCviuYxbjigPp0yJDLYoEWz43PltD5YQdZCHJyIsIzsm5m3ZAQZDZD')
    @events = graph.get_connections('18228677368', 'events')
  end

  def faqs()
    @faq_categories = FaqCategory.all

    id = (params[:id] or @faq_categories.first.id)

    @faq_category = @faq_categories.find(id.to_i)
  end
end
