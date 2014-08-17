module ApplicationHelper
  def navbar_link(url, text, li_id = nil)
    @urls = Array url

    @active_link = @urls.select { |url,_| current_page? url }.any?

    render partial: 'navbar_item', locals: {
      li_id: li_id,
      text: text
    }
  end
end
