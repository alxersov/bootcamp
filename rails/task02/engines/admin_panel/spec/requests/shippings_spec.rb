require 'rails_helper'

describe "shippings test", type: :request do
    it "returns all shippings" do
        get "/admin_panel/shippings"
        assert_response :success
    end
end
