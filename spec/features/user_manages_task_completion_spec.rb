require "spec_helper"

feature "User manages task completion" do
  scenario "completes task" do
    sign_in
    create_project "Shopping"
    click_link "Shopping"
    create_task "Buy milk"

    expect(page).to have_css(".label-success", :text => "Open")
    expect(page).not_to have_css(".label-danger", :text => "Closed")

    click_link "Close"

    expect(page).not_to have_css(".label-success", :text => "Open")
    expect(page).to have_css(".label-danger", :text => "Closed")
  end

  scenario "sees only incomplete tasks" do
    sign_in
    create_project "Shopping"
    click_link "Shopping"
    create_task "Buy milk"
    click_link "Tasks"

    expect(page).to have_css(".task-item", :text => "Buy milk")

    click_link "Buy milk"
    click_link "Close"
    click_link "Tasks"

    expect(page).not_to have_css(".task-item", :text => "Buy milk")
  end

  scenario "sees completion state from task list" do
    pending "Not needed for now"
    sign_in
    create_project "Shopping"
    click_link "Shopping"
    create_task "Buy milk"
    click_link "Tasks"

    task_item = find(".task-item")
    expect(task_item).to have_content("Open")
    expect(task_item).not_to have_content("Closed")

    click_link "Buy milk"
    click_link "Close"
    click_link "Tasks"

    expect(task_item).to have_content("Closed")
    expect(task_item).no_to have_content("Open")
  end
end
