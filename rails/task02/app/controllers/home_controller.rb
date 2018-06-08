class HomeController < ApplicationController
  def index
    @sliders = AdminPanel::Slider.all
    @featured_products = AdminPanel::FeaturedProduct.all
    @inspirations = AdminPanel::Inspiration.all
    @shippings = AdminPanel::Shipping.all
  end
end
