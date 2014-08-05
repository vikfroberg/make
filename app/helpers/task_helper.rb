module TaskHelper
  def link_to_edit(content, html_options = {})
    link_to(
      content,
      edit_project_task_path(@project, @task),
      html_options
    )
  end

  def link_to_new(content, html_options = {})
    link_to(
      content,
      new_project_task_path(@project),
      html_options
    )
  end

  def link_to_tag(tag)
    link_to(tag.name, project_tasks_path(@project, :tag => tag.name),
      :class => 'label label-default')
  end

  def linked_tag_list(tags)
    tags.map { |t| link_to_tag(t) }.join(' ').html_safe
  end
end
