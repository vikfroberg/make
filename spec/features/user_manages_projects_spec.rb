require "spec_helper"

feature "User manages projects" do

  background do
    @current_user = User.create! do |user|
      user.email = "vik.froberg@gmail.com"
      user.password = "password"
    end
    login_as(@current_user)
  end

  scenario "Create project", js: true do
    project_name = "iOS 8"

    visit root_path
    click_link "Add new project"

    fill_in "Name", :with => project_name
    click_button "Add project"

    expect(page).to have_content project_name
  end

  scenario "See projects", js: true do
    project_name = "iOS 8"

    create_project project_name

    visit root_path

    expect(page).to have_content project_name
  end

  scenario "Edit project", js: true do
    project_name = "iOS 8"
    new_project_name = "iOS 9"

    create_project project_name

    visit root_path
    project_element = page.find("li", :text => project_name)
    within project_element do
      click_on "Edit"
    end
    fill_in "Name", :with => new_project_name
    click_button "Save changes"

    expect(page).to have_content new_project_name
  end

  private

    def create_project(name)
      @current_user.projects.create!(name: name)
    end

end
