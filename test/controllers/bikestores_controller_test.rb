require 'test_helper'

class BikestoresControllerTest < ActionController::TestCase
  setup do
    @bikestore = bikestores(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bikestores)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bikestore" do
    assert_difference('Bikestore.count') do
      post :create, bikestore: { accuracy: @bikestore.accuracy, address: @bikestore.address, checked: @bikestore.checked, latitude: @bikestore.latitude, longitude: @bikestore.longitude, name: @bikestore.name, phone: @bikestore.phone, state: @bikestore.state, zipcode: @bikestore.zipcode }
    end

    assert_redirected_to bikestore_path(assigns(:bikestore))
  end

  test "should show bikestore" do
    get :show, id: @bikestore
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bikestore
    assert_response :success
  end

  test "should update bikestore" do
    patch :update, id: @bikestore, bikestore: { accuracy: @bikestore.accuracy, address: @bikestore.address, checked: @bikestore.checked, latitude: @bikestore.latitude, longitude: @bikestore.longitude, name: @bikestore.name, phone: @bikestore.phone, state: @bikestore.state, zipcode: @bikestore.zipcode }
    assert_redirected_to bikestore_path(assigns(:bikestore))
  end

  test "should destroy bikestore" do
    assert_difference('Bikestore.count', -1) do
      delete :destroy, id: @bikestore
    end

    assert_redirected_to bikestores_path
  end
end
