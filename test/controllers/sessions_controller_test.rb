require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @user.update(password: "password", password_confirmation: "password")
  end

  test "should get new" do
    get login_url
    assert_response :success
  end

  test "should create session" do
    post login_url, params: { email: @user.email, password: "password" }
    assert_redirected_to root_url
  end

  test "should destroy session" do
    delete logout_url
    assert_redirected_to root_url
  end
end
