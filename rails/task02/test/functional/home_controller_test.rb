require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response 200
    assert_not_nil assigns(:sliders)
    assert_not_nil assigns(:featured_products)
    assert_not_nil assigns(:inspirations)
    assert_not_nil assigns(:shippings)
  end

end
