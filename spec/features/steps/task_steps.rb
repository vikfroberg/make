module TaskSteps
  def create_task(title)
    click_link new_task_title
    fill_in "Title", :with => "Buy milk"
    click_button "Add task"
  end
end

RSpec.configure do |config|
  config.include TaskSteps
  config.include TaskHelper
end
