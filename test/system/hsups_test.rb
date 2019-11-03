require "application_system_test_case"

class HsupsTest < ApplicationSystemTestCase
  setup do
    @hsup = hsups(:one)
  end

  test "visiting the index" do
    visit hsups_url
    assert_selector "h1", text: "Hsups"
  end

  test "creating a Hsup" do
    visit hsups_url
    click_on "New Hsup"

    fill_in "Date", with: @hsup.date
    fill_in "Prestation", with: @hsup.prestation_id
    fill_in "Qte", with: @hsup.qte
    click_on "Create Hsup"

    assert_text "Hsup was successfully created"
    click_on "Back"
  end

  test "updating a Hsup" do
    visit hsups_url
    click_on "Edit", match: :first

    fill_in "Date", with: @hsup.date
    fill_in "Prestation", with: @hsup.prestation_id
    fill_in "Qte", with: @hsup.qte
    click_on "Update Hsup"

    assert_text "Hsup was successfully updated"
    click_on "Back"
  end

  test "destroying a Hsup" do
    visit hsups_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Hsup was successfully destroyed"
  end
end
