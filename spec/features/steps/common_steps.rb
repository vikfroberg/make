module CommonSteps
  # def ensure_on(path)
  #   visit(path) unless current_path == path
  # end

  def accept_confirm(message, &block)
    page.driver.accept_js_confirms!
    yield
    expect(page.driver.confirm_messages).to include(message)
    page.driver.dismiss_js_confirms!
  end
end

RSpec.configure do |config|
  config.include CommonSteps
end
