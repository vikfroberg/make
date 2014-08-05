module ProjectSteps
  def create_project(name)
    visit root_path
    click_link "Add new project"
    fill_in "Name", :with => name
    click_button "Add project"
  end
end

RSpec.configure do |config|
  config.include ProjectSteps
end
