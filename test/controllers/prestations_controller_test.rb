require 'test_helper'

class PrestationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @prestation = prestations(:one)
  end

  test "should get index" do
    get prestations_url
    assert_response :success
  end

  test "should get new" do
    get new_prestation_url
    assert_response :success
  end

  test "should create prestation" do
    assert_difference('Prestation.count') do
      post prestations_url, params: { prestation: { adresse: @prestation.adresse, client_id: @prestation.client_id, debut: @prestation.debut, employeur_id: @prestation.employeur_id, fin: @prestation.fin, hsup: @prestation.hsup, machine_id: @prestation.machine_id, nbjour: @prestation.nbjour, ville: @prestation.ville } }
    end

    assert_redirected_to prestation_url(Prestation.last)
  end

  test "should show prestation" do
    get prestation_url(@prestation)
    assert_response :success
  end

  test "should get edit" do
    get edit_prestation_url(@prestation)
    assert_response :success
  end

  test "should update prestation" do
    patch prestation_url(@prestation), params: { prestation: { adresse: @prestation.adresse, client_id: @prestation.client_id, debut: @prestation.debut, employeur_id: @prestation.employeur_id, fin: @prestation.fin, hsup: @prestation.hsup, machine_id: @prestation.machine_id, nbjour: @prestation.nbjour, ville: @prestation.ville } }
    assert_redirected_to prestation_url(@prestation)
  end

  test "should destroy prestation" do
    assert_difference('Prestation.count', -1) do
      delete prestation_url(@prestation)
    end

    assert_redirected_to prestations_url
  end
end
