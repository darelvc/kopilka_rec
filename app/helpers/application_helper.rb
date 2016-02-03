module ApplicationHelper

def link_to_in_li(body, url)
  active = "active" if current_page?(url)
  content_tag :li, class: active do
    link_to body, url
  end
end

end
