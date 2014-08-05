module TaskSteps
  def create_task(title)
    click_link "Add new task"
    fill_in "Title", :with => "Buy milk"
    click_button "Add task"
  end
end

RSpec.configure do |config|
  config.include TaskSteps
end
