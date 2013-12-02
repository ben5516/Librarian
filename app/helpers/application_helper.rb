module ApplicationHelper

  def menu_class(controller)
    params[:controller] == controller ? 'selected' : ''
  end

end
