module TaskHelper
  def new_task_title
    "Create a new task"
  end

  def edit_task_title
    "Edit task"
  end

  def link_to_tag(tag)
    link_to(tag.name, project_tasks_path(@project, :tag => tag.name),
      :class => 'label label-default')
  end

  def linked_tag_list(tags)
    tags.map { |t| link_to_tag(t) }.join(' ').html_safe
  end
end
