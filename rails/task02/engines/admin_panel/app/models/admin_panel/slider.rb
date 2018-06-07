module AdminPanel
  class Slider < ActiveRecord::Base
    attr_accessible :banner, :button_text, :button_url, :catption, :title
  end
end
