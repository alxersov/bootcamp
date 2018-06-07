module AdminPanel
  class FeaturedProduct < ActiveRecord::Base
    attr_accessible :image, :price, :title
  end
end
