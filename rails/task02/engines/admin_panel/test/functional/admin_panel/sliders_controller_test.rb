require 'test_helper'

module AdminPanel
  class SlidersControllerTest < ActionController::TestCase
    setup do
      @slider = sliders(:one)
    end
  
    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:sliders)
    end
  
    test "should get new" do
      get :new
      assert_response :success
    end
  
    test "should create slider" do
      assert_difference('Slider.count') do
        post :create, slider: { banner: @slider.banner, button_text: @slider.button_text, button_url: @slider.button_url, catption: @slider.catption, title: @slider.title }
      end
  
      assert_redirected_to slider_path(assigns(:slider))
    end
  
    test "should show slider" do
      get :show, id: @slider
      assert_response :success
    end
  
    test "should get edit" do
      get :edit, id: @slider
      assert_response :success
    end
  
    test "should update slider" do
      put :update, id: @slider, slider: { banner: @slider.banner, button_text: @slider.button_text, button_url: @slider.button_url, catption: @slider.catption, title: @slider.title }
      assert_redirected_to slider_path(assigns(:slider))
    end
  
    test "should destroy slider" do
      assert_difference('Slider.count', -1) do
        delete :destroy, id: @slider
      end
  
      assert_redirected_to sliders_path
    end
  end
end
