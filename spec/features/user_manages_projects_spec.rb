require "spec_helper"

feature "User manages projects" do
  scenario "Creates a project", js: true do
    sign_in
    create_project "Shopping"

    expect(page).to have_content "Shopping"
  end

  scenario "Sees a projects", js: true do
    sign_in
    create_project "Shopping"
    visit root_path

    expect(page).to have_content "Shopping"
  end

  scenario "Edit project", js: true do
    sign_in
    create_project "Shopping"

    visit root_path
    project("Shopping").click_on "Edit"
    fill_in "Name", :with => "Selling"
    click_button "Save changes"

    expect(page).to have_content "Selling"
  end

  private

  def project(name)
    page.find("li", :text => name)
  end
end
