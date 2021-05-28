require "application_system_test_case"

class AppointmentAppsTest < ApplicationSystemTestCase
  setup do
    @appointment_app = appointment_apps(:one)
  end

  test "visiting the index" do
    visit appointment_apps_url
    assert_selector "h1", text: "Appointment Apps"
  end

  test "creating a Appointment app" do
    visit appointment_apps_url
    click_on "New Appointment App"

    fill_in "Branchoffice", with: @appointment_app.branchoffice_id
    fill_in "Code", with: @appointment_app.code
    fill_in "Date", with: @appointment_app.date
    fill_in "Duration", with: @appointment_app.duration
    fill_in "State", with: @appointment_app.state
    fill_in "Time", with: @appointment_app.time
    fill_in "User", with: @appointment_app.user_id
    click_on "Create Appointment app"

    assert_text "Appointment app was successfully created"
    click_on "Back"
  end

  test "updating a Appointment app" do
    visit appointment_apps_url
    click_on "Edit", match: :first

    fill_in "Branchoffice", with: @appointment_app.branchoffice_id
    fill_in "Code", with: @appointment_app.code
    fill_in "Date", with: @appointment_app.date
    fill_in "Duration", with: @appointment_app.duration
    fill_in "State", with: @appointment_app.state
    fill_in "Time", with: @appointment_app.time
    fill_in "User", with: @appointment_app.user_id
    click_on "Update Appointment app"

    assert_text "Appointment app was successfully updated"
    click_on "Back"
  end

  test "destroying a Appointment app" do
    visit appointment_apps_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Appointment app was successfully destroyed"
  end
end
