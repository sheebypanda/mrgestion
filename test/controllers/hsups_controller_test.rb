require 'test_helper'

class HsupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hsup = hsups(:one)
  end

  test "should get index" do
    get hsups_url
    assert_response :success
  end

  test "should get new" do
    get new_hsup_url
    assert_response :success
  end

  test "should create hsup" do
    assert_difference('Hsup.count') do
      post hsups_url, params: { hsup: { date: @hsup.date, prestation_id: @hsup.prestation_id, qte: @hsup.qte } }
    end

    assert_redirected_to hsup_url(Hsup.last)
  end

  test "should show hsup" do
    get hsup_url(@hsup)
    assert_response :success
  end

  test "should get edit" do
    get edit_hsup_url(@hsup)
    assert_response :success
  end

  test "should update hsup" do
    patch hsup_url(@hsup), params: { hsup: { date: @hsup.date, prestation_id: @hsup.prestation_id, qte: @hsup.qte } }
    assert_redirected_to hsup_url(@hsup)
  end

  test "should destroy hsup" do
    assert_difference('Hsup.count', -1) do
      delete hsup_url(@hsup)
    end

    assert_redirected_to hsups_url
  end
end
