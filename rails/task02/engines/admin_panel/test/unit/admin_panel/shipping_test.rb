require 'test_helper'

module AdminPanel
  class ShippingTest < ActiveSupport::TestCase
    test "should not save without all required fields set" do
      s = Shipping.new
      assert !s.save
    end
  end
end
