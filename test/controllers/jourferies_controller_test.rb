require 'test_helper'

class JourferiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @jourfery = jourferies(:one)
  end

  test "should get index" do
    get jourferies_url
    assert_response :success
  end

  test "should get new" do
    get new_jourfery_url
    assert_response :success
  end

  test "should create jourfery" do
    assert_difference('Jourferie.count') do
      post jourferies_url, params: { jourfery: { date: @jourfery.date } }
    end

    assert_redirected_to jourfery_url(Jourferie.last)
  end

  test "should show jourfery" do
    get jourfery_url(@jourfery)
    assert_response :success
  end

  test "should get edit" do
    get edit_jourfery_url(@jourfery)
    assert_response :success
  end

  test "should update jourfery" do
    patch jourfery_url(@jourfery), params: { jourfery: { date: @jourfery.date } }
    assert_redirected_to jourfery_url(@jourfery)
  end

  test "should destroy jourfery" do
    assert_difference('Jourferie.count', -1) do
      delete jourfery_url(@jourfery)
    end

    assert_redirected_to jourferies_url
  end
end
