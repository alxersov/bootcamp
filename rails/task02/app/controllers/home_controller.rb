class HomeController < ApplicationController
  def index
    @sliders = AdminPanel::Slider.all
    @featured_products = AdminPanel::FeaturedProduct.all
  end
end
