module StyleHelper

  def nav_link(link_text, link_path, class_extra ="")
    class_name = current_page?(link_path) ? "current #{class_extra}" : "#{class_extra}"

    content_tag(:li, :class => class_name) do
      link_to link_text, link_path
    end
  end

  def to_do_list ()
    @to_dos_items = current_user.p_steps_user

    html_to_return = content_tag(:h1, 'To Do List')

    if @to_dos_items.any?
      html_to_return += content_tag (:ul) do
        render partial: 'shared/to_dos_feed_item', collection: @to_dos_items
      end
    end

    return html_to_return
  end


end
