require "application_system_test_case"

class EmployeursTest < ApplicationSystemTestCase
  setup do
    @employeur = employeurs(:one)
  end

  test "visiting the index" do
    visit employeurs_url
    assert_selector "h1", text: "Employeurs"
  end

  test "creating a Employeur" do
    visit employeurs_url
    click_on "New Employeur"

    fill_in "Adresse", with: @employeur.adresse
    fill_in "Cp", with: @employeur.cp
    fill_in "Email", with: @employeur.email
    fill_in "Email2", with: @employeur.email2
    fill_in "Nom", with: @employeur.nom
    fill_in "Siret", with: @employeur.siret
    fill_in "Tel", with: @employeur.tel
    fill_in "Ville", with: @employeur.ville
    click_on "Create Employeur"

    assert_text "Employeur was successfully created"
    click_on "Back"
  end

  test "updating a Employeur" do
    visit employeurs_url
    click_on "Edit", match: :first

    fill_in "Adresse", with: @employeur.adresse
    fill_in "Cp", with: @employeur.cp
    fill_in "Email", with: @employeur.email
    fill_in "Email2", with: @employeur.email2
    fill_in "Nom", with: @employeur.nom
    fill_in "Siret", with: @employeur.siret
    fill_in "Tel", with: @employeur.tel
    fill_in "Ville", with: @employeur.ville
    click_on "Update Employeur"

    assert_text "Employeur was successfully updated"
    click_on "Back"
  end

  test "destroying a Employeur" do
    visit employeurs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Employeur was successfully destroyed"
  end
end
