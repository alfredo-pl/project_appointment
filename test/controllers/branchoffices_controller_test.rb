require "test_helper"

class BranchofficesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @branchoffice = branchoffices(:one)
  end

  test "should get index" do
    get branchoffices_url
    assert_response :success
  end

  test "should get new" do
    get new_branchoffice_url
    assert_response :success
  end

  test "should create branchoffice" do
    assert_difference('Branchoffice.count') do
      post branchoffices_url, params: { branchoffice: { address: @branchoffice.address, business_id: @branchoffice.business_id, city: @branchoffice.city, code_branchoffice: @branchoffice.code_branchoffice } }
    end

    assert_redirected_to branchoffice_url(Branchoffice.last)
  end

  test "should show branchoffice" do
    get branchoffice_url(@branchoffice)
    assert_response :success
  end

  test "should get edit" do
    get edit_branchoffice_url(@branchoffice)
    assert_response :success
  end

  test "should update branchoffice" do
    patch branchoffice_url(@branchoffice), params: { branchoffice: { address: @branchoffice.address, business_id: @branchoffice.business_id, city: @branchoffice.city, code_branchoffice: @branchoffice.code_branchoffice } }
    assert_redirected_to branchoffice_url(@branchoffice)
  end

  test "should destroy branchoffice" do
    assert_difference('Branchoffice.count', -1) do
      delete branchoffice_url(@branchoffice)
    end

    assert_redirected_to branchoffices_url
  end
end
