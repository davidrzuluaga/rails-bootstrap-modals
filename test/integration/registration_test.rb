require 'test_helper'

class RegistrationTest < ActionDispatch::IntegrationTest
  test "user can register" do
    visit root_path
    click_link "Sign Up"
    fill_in "Email", with: "test@example.com"
    fill_in "Password", with: "test1234"
    fill_in "Password confirmation", with: "test1234"
    click_button "Sign up"

    assert_current_path root_path
    assert page.has_content?('Products')
    assert page.has_content?('Precio')
  end
end