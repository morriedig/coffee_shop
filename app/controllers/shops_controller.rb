class ShopsController < ApplicationController

  def index
    @shops = Shop.all
    @shop = Shop.new
  end

  def create
    @shop = Shop.create(shop_params)
  end

  def show
    find_shop
  end

  def destroy
    find_shop
    @shop.desctroy
  end



  private

  def find_shop
    @shop = Shop.find(params[:id])
  end

  def shop_params
    params.require(:shop).permit(:name, :description, :phone, :photo)
  end

end
