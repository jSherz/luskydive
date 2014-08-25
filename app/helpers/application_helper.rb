# Application-wide helpers
module ApplicationHelper
  def navbar_link(link_url, text, li_id = nil)
    @urls = Array link_url

    @active_link = @urls.select { |url, _| current_page? url }.any?

    render partial: 'navbar_item', locals: {
      li_id: li_id,
      text: text
    }
  end
end
