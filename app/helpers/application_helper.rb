module ApplicationHelper
  include ::Pagy::Frontend

  def tailwind_pagy_nav(pagy)
    html = []

    # Prev button
    html << if pagy.prev
      link_to("&laquo;".html_safe, url_for(page: pagy.prev),
        class: "px-3 py-1 rounded-l border border-gray-300 bg-white text-gray-600 hover:bg-gray-100")
    else
      content_tag(:span, "&laquo;".html_safe,
        class: "px-3 py-1 rounded-l border border-gray-300 bg-gray-100 text-gray-400 cursor-not-allowed")
    end

    # Page numbers
    (1..pagy.pages).each do |page|
      if page == pagy.page
        html << content_tag(:span, page, class: "px-3 py-1 border bg-teal-600 text-white rounded")
      elsif (pagy.page - page).abs <= 2 || page == 1 || page == pagy.pages
        html << link_to(page, url_for(page: page),
          class: "px-3 py-1 border bg-white text-gray-700 hover:bg-gray-100 rounded")
      elsif (pagy.page - page).abs == 3
        html << content_tag(:span, "...", class: "px-3 py-1 text-gray-500")
      end
    end

    # Next button
    html << if pagy.next
      link_to("&raquo;".html_safe, url_for(page: pagy.next),
        class: "px-3 py-1 rounded-r border border-gray-300 bg-white text-gray-600 hover:bg-gray-100")
    else
      content_tag(:span, "&raquo;".html_safe,
        class: "px-3 py-1 rounded-r border border-gray-300 bg-gray-100 text-gray-400 cursor-not-allowed")
    end

    content_tag(:nav, class: "mt-8 flex justify-center") do
      content_tag(:div, class: "inline-flex shadow-sm") do
        safe_join(html)
      end
    end
  end
end
