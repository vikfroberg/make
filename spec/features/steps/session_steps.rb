module SessionSteps
  def sign_in
    sign_in_with("user@example.com", "password")
  end

  def sign_in_with(email, password)
    create(:user, email: email, password: password)
    visit root_path
    click_link "Sign in"
    fill_in "Email", :with => email
    fill_in "Password", :with => password
    click_button "Sign in"
  end

  def sign_in_as(user)
    login_as(user, scope: :user)
  end
end

RSpec.configure do |config|
  config.include SessionSteps
end
