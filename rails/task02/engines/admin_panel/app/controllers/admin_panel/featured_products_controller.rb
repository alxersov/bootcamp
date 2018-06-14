require_dependency "admin_panel/application_controller"

module AdminPanel
  class FeaturedProductsController < ApplicationController
    # GET /featured_products
    # GET /featured_products.json
    def index
      @featured_products = FeaturedProduct.all
  
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @featured_products }
      end
    end
  
    # GET /featured_products/1
    # GET /featured_products/1.json
    def show
      @featured_product = FeaturedProduct.find(params[:id])
  
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @featured_product }
      end
    end
  
    # GET /featured_products/new
    # GET /featured_products/new.json
    def new
      @featured_product = FeaturedProduct.new
  
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @featured_product }
      end
    end
  
    # GET /featured_products/1/edit
    def edit
      @featured_product = FeaturedProduct.find(params[:id])
    end
  
    # POST /featured_products
    # POST /featured_products.json
    def create
      @featured_product = FeaturedProduct.new(params[:featured_product])
  
      respond_to do |format|
        if @featured_product.save
          format.html { redirect_to @featured_product, notice: 'Featured product was successfully created.' }
          format.json { render json: @featured_product, status: :created, location: @featured_product }
        else
          format.html { render action: "new" }
          format.json { render json: @featured_product.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # PUT /featured_products/1
    # PUT /featured_products/1.json
    def update
      @featured_product = FeaturedProduct.find(params[:id])
  
      respond_to do |format|
        if @featured_product.update_attributes(params[:featured_product])
          format.html { redirect_to @featured_product, notice: 'Featured product was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @featured_product.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /featured_products/1
    # DELETE /featured_products/1.json
    def destroy
      @featured_product = FeaturedProduct.find(params[:id])
      @featured_product.destroy
  
      respond_to do |format|
        format.html { redirect_to featured_products_url }
        format.json { head :no_content }
      end
    end
  end
end
