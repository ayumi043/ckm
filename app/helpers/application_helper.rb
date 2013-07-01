module ApplicationHelper
 
  def current_class(arg_controller_name)
    'class=active' if controller_name == arg_controller_name
  end

  def current_menu(arg_controller_name, *arg_c)
    'class=select' if controller_name == arg_controller_name || controller_name == arg_c.first
  end

  def title(page_title)
    content_for(:title) { page_title }
  end

  def keywords(page_keywords)
    content_for(:keywords) { page_keywords }
  end

  def description(page_description)
    content_for(:description) { page_description }
  end

end
