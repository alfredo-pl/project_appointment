require "application_system_test_case"

class BranchofficesTest < ApplicationSystemTestCase
  setup do
    @branchoffice = branchoffices(:one)
  end

  test "visiting the index" do
    visit branchoffices_url
    assert_selector "h1", text: "Branchoffices"
  end

  test "creating a Branchoffice" do
    visit branchoffices_url
    click_on "New Branchoffice"

    fill_in "Address", with: @branchoffice.address
    fill_in "Business", with: @branchoffice.business_id
    fill_in "City", with: @branchoffice.city
    fill_in "Code branchoffice", with: @branchoffice.code_branchoffice
    click_on "Create Branchoffice"

    assert_text "Branchoffice was successfully created"
    click_on "Back"
  end

  test "updating a Branchoffice" do
    visit branchoffices_url
    click_on "Edit", match: :first

    fill_in "Address", with: @branchoffice.address
    fill_in "Business", with: @branchoffice.business_id
    fill_in "City", with: @branchoffice.city
    fill_in "Code branchoffice", with: @branchoffice.code_branchoffice
    click_on "Update Branchoffice"

    assert_text "Branchoffice was successfully updated"
    click_on "Back"
  end

  test "destroying a Branchoffice" do
    visit branchoffices_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Branchoffice was successfully destroyed"
  end
end
