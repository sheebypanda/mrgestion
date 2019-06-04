require 'test_helper'

class IntemperiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @intempery = intemperies(:one)
  end

  test "should get index" do
    get intemperies_url
    assert_response :success
  end

  test "should get new" do
    get new_intempery_url
    assert_response :success
  end

  test "should create intempery" do
    assert_difference('Intemperie.count') do
      post intemperies_url, params: { intempery: { date: @intempery.date } }
    end

    assert_redirected_to intempery_url(Intemperie.last)
  end

  test "should show intempery" do
    get intempery_url(@intempery)
    assert_response :success
  end

  test "should get edit" do
    get edit_intempery_url(@intempery)
    assert_response :success
  end

  test "should update intempery" do
    patch intempery_url(@intempery), params: { intempery: { date: @intempery.date } }
    assert_redirected_to intempery_url(@intempery)
  end

  test "should destroy intempery" do
    assert_difference('Intemperie.count', -1) do
      delete intempery_url(@intempery)
    end

    assert_redirected_to intemperies_url
  end
end
