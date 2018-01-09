class PositionsController < ApplicationController

  def create
    @shop = Shop.find(params[:id])
    @position = @shop.positions.create(params_params)
  end

  def update
    @position = Position.find(params[:position_id])
    @position.update(position_params)
    @position.save
  end

  private

  def position_params
    params.require(:position).permit(:address, :latitude, :longitude, :shop_id)
  end
end
