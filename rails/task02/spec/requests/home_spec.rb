require 'rails_helper'

describe "home test", type: :request do
    it "renders home page" do
        get "/"
        assert_response :success
        assert_select "title", "Home"
    end
end
