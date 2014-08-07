require "spec_helper"

# Discussions
# - Support and todo in the same system?
# -- Aggregate and answer emails from Make
# -- Send emails from Make (comments, discussions) ie. subscribe

# Why?
# - Collect feedback
# - Collect ideas
# - Collect bugs

feature "Discussions" do
  scenario "user creates a discussion with no details" do
    sign_in
    create_project "Project"
    click_link "Project"
    click_link "Discussions"
    click_link "Start a new discussion"
    fill_in "Title", :with => "Can't change password"
    click_button "Start discussion"

    expect(current_path).to match(/discussions\/[0-9]+$/)
    expect(page).to have_css("h1", :text => "Can't change password")
    expect(page).not_to have_css(".comment")
  end

  scenario "user creates a discussion with details" do
    sign_in
    create_project "Project"
    click_link "Project"
    click_link "Discussions"
    click_link "Start a new discussion"
    fill_in "Title", :with => "Can't change password"
    fill_in "Details", :with => "Password stays the same"
    click_button "Start discussion"

    expect(current_path).to match(/discussions\/[0-9]+$/)
    expect(page).to have_css("h1", :text => "Can't change password")
    expect(page).to have_css(".comment", :text => "Password stays the same")
  end

  scenario "user sees a list discussions for project" do
    user = create(:user)

    this_project = create(:project, name: "This project", user: user)
    this_discussion = create(:discussion, title: "My discussion", project: this_project)

    another_project = create(:project, name: "Another project", user: user)
    another_discussion = create(:discussion, title: "Your discussion", project: another_project)

    sign_in_as(user)
    visit root_path
    visit_project "This project"
    click_link "Discussions"

    expect(page).to have_css(".discussion", :text => this_discussion.title)
    expect(page).not_to have_css(".discussion", :text => another_discussion.title)
  end

  def visit_project(name)
    click_link name
  end
end
