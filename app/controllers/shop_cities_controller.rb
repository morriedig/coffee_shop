class ShopCitiesController < ApplicationController

  def show
    @shop_cities = ShopCity.all
    @shops = ShopCity.find(params[:id]).shops.page(params[:page]).per(15)
  end
end
