require "application_system_test_case"

class JourferiesTest < ApplicationSystemTestCase
  setup do
    @jourfery = jourferies(:one)
  end

  test "visiting the index" do
    visit jourferies_url
    assert_selector "h1", text: "Jourferies"
  end

  test "creating a Jourferie" do
    visit jourferies_url
    click_on "New Jourferie"

    fill_in "Date", with: @jourfery.date
    click_on "Create Jourferie"

    assert_text "Jourferie was successfully created"
    click_on "Back"
  end

  test "updating a Jourferie" do
    visit jourferies_url
    click_on "Edit", match: :first

    fill_in "Date", with: @jourfery.date
    click_on "Update Jourferie"

    assert_text "Jourferie was successfully updated"
    click_on "Back"
  end

  test "destroying a Jourferie" do
    visit jourferies_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Jourferie was successfully destroyed"
  end
end
