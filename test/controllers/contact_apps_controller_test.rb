require "test_helper"

class ContactAppsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @contact_app = contact_apps(:one)
  end

  test "should get index" do
    get contact_apps_url, as: :json
    assert_response :success
  end

  test "should create contact_app" do
    assert_difference("ContactApp.count") do
      post contact_apps_url, params: { contact_app: { address: @contact_app.address, age: @contact_app.age, firstname: @contact_app.firstname, lastname: @contact_app.lastname, phonenumber: @contact_app.phonenumber, sex: @contact_app.sex } }, as: :json
    end

    assert_response :created
  end

  test "should show contact_app" do
    get contact_app_url(@contact_app), as: :json
    assert_response :success
  end

  test "should update contact_app" do
    patch contact_app_url(@contact_app), params: { contact_app: { address: @contact_app.address, age: @contact_app.age, firstname: @contact_app.firstname, lastname: @contact_app.lastname, phonenumber: @contact_app.phonenumber, sex: @contact_app.sex } }, as: :json
    assert_response :success
  end

  test "should destroy contact_app" do
    assert_difference("ContactApp.count", -1) do
      delete contact_app_url(@contact_app), as: :json
    end

    assert_response :no_content
  end
end
