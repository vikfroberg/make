module ApplicationHelper
  def title(title)
    content_for(:title) { title }
    title
  end

  def title_for_new_action
    model_name = params[:controller].singularize
    "Add new #{model_name}"
  end

  def title_for_edit_action
    model_name = params[:controller].singularize
    "Edit #{model_name}"
  end

  def flash_class(level)
    case level.to_sym
      when :notice then "alert alert-info"
      when :success then "alert alert-success"
      when :error then "alert alert-danger"
      when :alert then "alert alert-warning"
    end
  end
end
