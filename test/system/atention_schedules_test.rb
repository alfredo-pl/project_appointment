require "application_system_test_case"

class AtentionSchedulesTest < ApplicationSystemTestCase
  setup do
    @atention_schedule = atention_schedules(:one)
  end

  test "visiting the index" do
    visit atention_schedules_url
    assert_selector "h1", text: "Atention Schedules"
  end

  test "creating a Atention schedule" do
    visit atention_schedules_url
    click_on "New Atention Schedule"

    fill_in "Branchoffice", with: @atention_schedule.branchoffice_id
    fill_in "Day", with: @atention_schedule.day
    fill_in "Hour end", with: @atention_schedule.hour_end
    fill_in "Hour init", with: @atention_schedule.hour_init
    click_on "Create Atention schedule"

    assert_text "Atention schedule was successfully created"
    click_on "Back"
  end

  test "updating a Atention schedule" do
    visit atention_schedules_url
    click_on "Edit", match: :first

    fill_in "Branchoffice", with: @atention_schedule.branchoffice_id
    fill_in "Day", with: @atention_schedule.day
    fill_in "Hour end", with: @atention_schedule.hour_end
    fill_in "Hour init", with: @atention_schedule.hour_init
    click_on "Update Atention schedule"

    assert_text "Atention schedule was successfully updated"
    click_on "Back"
  end

  test "destroying a Atention schedule" do
    visit atention_schedules_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Atention schedule was successfully destroyed"
  end
end
