module ApplicationHelper
  def navbar_link(url, text)
    # TODO: Made less awful
    raw("<li>
          <i class=\"seperator fa fa-ellipsis-v\"></i>
        </li>
        <li>
          <a href=\"#{url}\"#{' class="active"' if current_page? url}>
            #{text}
          </a>
        </li>")
  end
end
