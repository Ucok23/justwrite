require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    delete logout_url
  end
  test "should get new" do
    get signup_url
    assert_response :success
  end

  test "should create user" do
    assert_difference("User.count") do
      post signup_url, params: { user: { name: "Test", email: "test@example.com", password: "password", password_confirmation: "password" } }
    end

    assert_redirected_to root_url
  end
end
