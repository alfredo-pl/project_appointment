require "test_helper"

class AppointmentAppsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @appointment_app = appointment_apps(:one)
  end

  test "should get index" do
    get appointment_apps_url
    assert_response :success
  end

  test "should get new" do
    get new_appointment_app_url
    assert_response :success
  end

  test "should create appointment_app" do
    assert_difference('AppointmentApp.count') do
      post appointment_apps_url, params: { appointment_app: { branchoffice_id: @appointment_app.branchoffice_id, code: @appointment_app.code, date: @appointment_app.date, duration: @appointment_app.duration, state: @appointment_app.state, time: @appointment_app.time, user_id: @appointment_app.user_id } }
    end

    assert_redirected_to appointment_app_url(AppointmentApp.last)
  end

  test "should show appointment_app" do
    get appointment_app_url(@appointment_app)
    assert_response :success
  end

  test "should get edit" do
    get edit_appointment_app_url(@appointment_app)
    assert_response :success
  end

  test "should update appointment_app" do
    patch appointment_app_url(@appointment_app), params: { appointment_app: { branchoffice_id: @appointment_app.branchoffice_id, code: @appointment_app.code, date: @appointment_app.date, duration: @appointment_app.duration, state: @appointment_app.state, time: @appointment_app.time, user_id: @appointment_app.user_id } }
    assert_redirected_to appointment_app_url(@appointment_app)
  end

  test "should destroy appointment_app" do
    assert_difference('AppointmentApp.count', -1) do
      delete appointment_app_url(@appointment_app)
    end

    assert_redirected_to appointment_apps_url
  end
end
