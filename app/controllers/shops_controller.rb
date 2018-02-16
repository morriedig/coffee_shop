class ShopsController < ApplicationController

  def index
    # @shops = Shop.all
    if params[:search] != nil
      @shops = Shop.search(params[:search])
    else
      @shops = Shop.all
    end
  end

  def create
    @shop = Shop.create(shop_params)
  end

  def show
    find_shop
    @hash = Gmaps4rails.build_markers(@shop) do |gmap, marker|
       marker.lat gmap.latitude
       marker.lng gmap.longitude
       marker.infowindow gmap.address
    end
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
