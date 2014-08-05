require 'spec_helper'

feature 'User filters tasks with tag' do
  scenario 'User filter tasks with tag code' do
    sign_in
    create_project "Shopping"
    click_link "Shopping"
    create_task "Buy milk"
    click_link "Add new task"
    fill_in "Title", :with => "Buy candy"
    fill_in "Tags", :with => "important"
    click_button "Add task"
    click_link "Tasks"

    expect(page).to have_css(".task-item", :text => "Buy milk")
    expect(page).to have_css(".task-item", :text => "Buy candy")

    within ".list-group" do
      click_link "important"
    end

    expect(page).not_to have_css(".task-item", :text => "Buy milk")
    expect(page).to have_css(".task-item", :text => "Buy candy")
  end

  scenario 'User filter tasks with tag important and sees only incompleted' do
    sign_in
    create_project "Shopping"
    click_link "Shopping"
    click_link "Add new task"
    fill_in "Title", :with => "Buy milk"
    fill_in "Tags", :with => "important"
    click_button "Add task"
    click_link "Add new task"
    fill_in "Title", :with => "Buy candy"
    fill_in "Tags", :with => "important"
    click_button "Add task"
    click_link "Tasks"

    within ".list-group" do
      click_link "important"
    end

    expect(page).to have_css(".task-item", :text => "Buy milk")
    expect(page).to have_css(".task-item", :text => "Buy candy")

    click_link "Buy candy"
    click_link "Close"
    click_link "Tasks"
    within ".list-group" do
      click_link "important"
    end

    expect(page).to have_css(".task-item", :text => "Buy milk")
    expect(page).not_to have_css(".task-item", :text => "Buy candy")
  end
end
