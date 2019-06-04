require 'test_helper'

class EmployeursControllerTest < ActionDispatch::IntegrationTest
  setup do
    @employeur = employeurs(:one)
  end

  test "should get index" do
    get employeurs_url
    assert_response :success
  end

  test "should get new" do
    get new_employeur_url
    assert_response :success
  end

  test "should create employeur" do
    assert_difference('Employeur.count') do
      post employeurs_url, params: { employeur: { adresse: @employeur.adresse, cp: @employeur.cp, email: @employeur.email, email2: @employeur.email2, nom: @employeur.nom, siret: @employeur.siret, tel: @employeur.tel, ville: @employeur.ville } }
    end

    assert_redirected_to employeur_url(Employeur.last)
  end

  test "should show employeur" do
    get employeur_url(@employeur)
    assert_response :success
  end

  test "should get edit" do
    get edit_employeur_url(@employeur)
    assert_response :success
  end

  test "should update employeur" do
    patch employeur_url(@employeur), params: { employeur: { adresse: @employeur.adresse, cp: @employeur.cp, email: @employeur.email, email2: @employeur.email2, nom: @employeur.nom, siret: @employeur.siret, tel: @employeur.tel, ville: @employeur.ville } }
    assert_redirected_to employeur_url(@employeur)
  end

  test "should destroy employeur" do
    assert_difference('Employeur.count', -1) do
      delete employeur_url(@employeur)
    end

    assert_redirected_to employeurs_url
  end
end
