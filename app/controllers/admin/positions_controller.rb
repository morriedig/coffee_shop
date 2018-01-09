class Admin::PositionsController < ApplicationController

  def create
    @shop = Shop.find(params[:shop_id])
    @position = @shop.positions.build(position_params)
    if @position.save
    else
      redirect_to admin_shops_path(@shop)
    end
  end

  def destroy
    @position = Position.find(params[:id])
    @position.destroy
  end

  def edit
    @position = Position.find(params[:id])
  end

  def update
    @position = Position.find(params[:id])
    @position.update(position_params)
  end


  private

  def position_params
    params.require(:position).permit(:address, :latitude, :longitude, :shop_id)
  end

end
