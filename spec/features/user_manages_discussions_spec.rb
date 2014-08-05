require "spec_helper"

# Discussions
# - Support and todo in the same system?
# -- Aggregate and answer emails from Make
# -- Send emails from Make (comments, discussions) ie. subscribe

# Start new discussion is primary, create a new task is secondary

# Why?
# - Collect feedback
# - Collect ideas
# - Collect bugs

feature "Discussions" do
  scenario "user creates a discussion with no details" do
    sign_in
    create_project "Meta"
    visit_project "Meta"
    click_link "Start a new discussion"
    fill_in "Title", :with => "Can't change password"
    click_button "Start discussion"

    expect(current_path).to match(/discussions\/[0-9]+$/)
    expect(page).to have_css(".page-title", :text => "Can't change password")
    expect(page).not_to have_css(".comment")
  end

  scenario "user creates a discussion with details" do
    sign_in
    create_project "Meta"
    visit_project "Meta"
    click_link "Start a new discussion"
    fill_in "Title", :with => "Can't change password"
    fill_in "Details", :with => "Password stays the same"
    click_button "Start discussion"

    expect(current_path).to match(/discussions\/[0-9]+$/)
    expect(page).to have_css(".page-title", :text => "Can't change password")
    expect(page).to have_css(".comment", :text => "Password stays the same")
  end

  def visit_project(name)
    click_link name
  end
end
