module AdminPanel
  class Shipping < ActiveRecord::Base
    attr_accessible :text, :title
  end
end
