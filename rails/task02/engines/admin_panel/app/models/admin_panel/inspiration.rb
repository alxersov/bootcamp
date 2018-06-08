module AdminPanel
  class Inspiration < ActiveRecord::Base
    attr_accessible :image, :title, :url
  end
end
