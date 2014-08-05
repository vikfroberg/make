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

  # def markdown(text)
  #   render_options = {
  #     filter_html: true,
  #     hard_wrap: true,
  #     no_styles: true
  #   }
  #   renderer = Redcarpet::Render::HTML.new(render_options)

  #   extensions = {
  #     autolink: true,
  #     fenced_code_blocks: true,
  #     lax_spacing: true,
  #     no_intra_emphasis: true,
  #     space_after_headers: true
  #   }
  #   Redcarpet::Markdown.new(renderer, extensions).render(text).html_safe
  # end

  # def markdown_annotation
  #   link = link_to 'Markdown',
  #     'https://guides.github.com/features/mastering-markdown'
  #   "Format text with #{link}.".html_safe
  # end
end
