require "test_helper"

class AtentionSchedulesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @atention_schedule = atention_schedules(:one)
  end

  test "should get index" do
    get atention_schedules_url
    assert_response :success
  end

  test "should get new" do
    get new_atention_schedule_url
    assert_response :success
  end

  test "should create atention_schedule" do
    assert_difference('AtentionSchedule.count') do
      post atention_schedules_url, params: { atention_schedule: { branchoffice_id: @atention_schedule.branchoffice_id, day: @atention_schedule.day, hour_end: @atention_schedule.hour_end, hour_init: @atention_schedule.hour_init } }
    end

    assert_redirected_to atention_schedule_url(AtentionSchedule.last)
  end

  test "should show atention_schedule" do
    get atention_schedule_url(@atention_schedule)
    assert_response :success
  end

  test "should get edit" do
    get edit_atention_schedule_url(@atention_schedule)
    assert_response :success
  end

  test "should update atention_schedule" do
    patch atention_schedule_url(@atention_schedule), params: { atention_schedule: { branchoffice_id: @atention_schedule.branchoffice_id, day: @atention_schedule.day, hour_end: @atention_schedule.hour_end, hour_init: @atention_schedule.hour_init } }
    assert_redirected_to atention_schedule_url(@atention_schedule)
  end

  test "should destroy atention_schedule" do
    assert_difference('AtentionSchedule.count', -1) do
      delete atention_schedule_url(@atention_schedule)
    end

    assert_redirected_to atention_schedules_url
  end
end
