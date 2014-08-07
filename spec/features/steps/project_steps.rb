module ProjectSteps
  def create_project(name)
    visit root_path
    click_link new_project_title
    fill_in "Name", :with => name
    click_button "Add project"
  end
end

RSpec.configure do |config|
  config.include ProjectSteps
  config.include ProjectHelper
end
