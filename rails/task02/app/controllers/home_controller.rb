class HomeController < ApplicationController
  def index
    @sliders = AdminPanel::Slider.all
  end
end
