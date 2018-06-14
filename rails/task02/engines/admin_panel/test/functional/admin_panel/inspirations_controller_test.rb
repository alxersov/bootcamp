require 'test_helper'

module AdminPanel
  class InspirationsControllerTest < ActionController::TestCase
    setup do
      @inspiration = inspirations(:one)
    end
  
    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:inspirations)
    end
  
    test "should get new" do
      get :new
      assert_response :success
    end
  
    test "should create inspiration" do
      assert_difference('Inspiration.count') do
        post :create, inspiration: { image: @inspiration.image, title: @inspiration.title, url: @inspiration.url }
      end
  
      assert_redirected_to inspiration_path(assigns(:inspiration))
    end
  
    test "should show inspiration" do
      get :show, id: @inspiration
      assert_response :success
    end
  
    test "should get edit" do
      get :edit, id: @inspiration
      assert_response :success
    end
  
    test "should update inspiration" do
      put :update, id: @inspiration, inspiration: { image: @inspiration.image, title: @inspiration.title, url: @inspiration.url }
      assert_redirected_to inspiration_path(assigns(:inspiration))
    end
  
    test "should destroy inspiration" do
      assert_difference('Inspiration.count', -1) do
        delete :destroy, id: @inspiration
      end
  
      assert_redirected_to inspirations_path
    end
  end
end
