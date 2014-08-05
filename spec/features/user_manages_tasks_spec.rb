require "spec_helper"

feature "Manages tasks" do
  scenario "user adds a new task" do
    sign_in
    create_project "Shopping"
    click_link "Shopping"
    create_task "Buy milk"

    user_sees_task "Buy milk"
  end

  scenario "user only sees tasks for project" do
    sign_in
    create_project "Shopping"
    click_link "Shopping"
    create_task "Buy milk"

    create_project "Traveling"
    click_link "Traveling"
    create_task "Book trip to Hawaii"
    click_link "Tasks"

    user_sees_task_in_list "Book trip to Hawaii"
  end

  scenario "user deletes task", :js => true do
    sign_in
    create_project "Shopping"
    click_link "Shopping"
    create_task "Buy milk"
    click_link "Tasks"

    user_sees_task_in_list "Buy milk"

    click_link "Buy milk"
    click_link "Edit"
    accept_confirm "Are you sure?" do
      click_link "Delete"
    end

    user_got_redirected_to_project_tasks
    user_does_not_see_task_in_list "Buy milk"
  end

  def user_sees_task_in_list(title)
    expect(page).to have_css("li.task-item", :text => "Buy milk")
  end

  def user_does_not_see_task_in_list(title)
    expect(page).not_to have_css("li.task-item", :text => "Buy milk")
  end

  def user_sees_task(title)
    expect(page).to have_css("h1", :text => title)
  end

  def user_got_redirected_to_project_tasks
    expect(current_path).to include("projects", "tasks")
  end
end
