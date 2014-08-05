module ApplicationHelper
  def navbar_link(url, text)
    # Make url into an array if not already
    urls = [*url]

    active_link = !urls.select { |url,_| current_page? url }.empty?

    raw("<li>
          <i class=\"seperator fa fa-ellipsis-v\"></i>
        </li>
        <li>
          <a href=\"#{urls.first}\"#{' class="active"' if active_link}>
            #{text}
          </a>
        </li>")
  end
end
