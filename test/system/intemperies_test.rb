require "application_system_test_case"

class IntemperiesTest < ApplicationSystemTestCase
  setup do
    @intempery = intemperies(:one)
  end

  test "visiting the index" do
    visit intemperies_url
    assert_selector "h1", text: "Intemperies"
  end

  test "creating a Intemperie" do
    visit intemperies_url
    click_on "New Intemperie"

    fill_in "Date", with: @intempery.date
    click_on "Create Intemperie"

    assert_text "Intemperie was successfully created"
    click_on "Back"
  end

  test "updating a Intemperie" do
    visit intemperies_url
    click_on "Edit", match: :first

    fill_in "Date", with: @intempery.date
    click_on "Update Intemperie"

    assert_text "Intemperie was successfully updated"
    click_on "Back"
  end

  test "destroying a Intemperie" do
    visit intemperies_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Intemperie was successfully destroyed"
  end
end
