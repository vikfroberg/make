require 'spec_helper'

feature 'User manages tags' do
  scenario 'User add tags' do
    @current_user = User.create! do |user|
      user.email = 'vik.froberg@gmail.com'
      user.password = 'password'
    end
    login_as(@current_user)
    @project = @current_user.projects.create!(name: 'Meta')

    visit new_project_task_path(@project)

    fill_in 'Title', :with => 'Todo'
    fill_in 'Tags', :with => 'promoted, code'
    click_button 'Add task'

    expect(page).to have_content 'promoted'
    expect(page).to have_content 'code'
  end

  scenario 'User removes tags' do
    @current_user = User.create! do |user|
      user.email = 'vik.froberg@gmail.com'
      user.password = 'password'
    end
    login_as(@current_user)
    @project = @current_user.projects.create!(name: 'Meta')

    visit new_project_task_path(@project)

    fill_in 'Title', :with => 'Todo'
    fill_in 'Tags', :with => 'promoted, code'
    click_button 'Add task'

    click_link 'Edit'
    fill_in 'Tags', :with => 'promoted'
    click_button 'Save changes'

    expect(page).to have_content 'promoted'
  end

  scenario "only sees tags used for incomplete tasks" do
    sign_in
    create_project "Shopping"
    click_link "Shopping"
    click_link "Add new task"
    fill_in "Title", :with => "Buy milk"
    fill_in "Tags", :with => "important"
    click_button "Add task"
    click_link "Tasks"
    within ".list-group" do
      click_link "important"
    end

    expect(page).to have_css(".list-group", :text => "important")

    click_link "Buy milk"
    click_link "Close"
    click_link "Tasks"

    expect(page).not_to have_css(".list-group", :text => "important")
  end
end
