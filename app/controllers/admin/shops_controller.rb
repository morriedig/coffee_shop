class Admin::ShopsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin

  def index
    @shops = Shop.all
    @new_shop = Shop.new
    @position = Position.new
  end

  def edit
    find_shop
  end

  def update
    find_shop
    @shop.update(shop_params)
    @position = Position.new
  end

  def create
    @shop = Shop.create(shop_params)
  end

  def destroy
    find_shop
    @shop.destroy
  end


  private

  def find_shop
    @shop = Shop.find(params[:id])
  end

  def shop_params
    params.require(:shop).permit(:name, :description, :phone, :photo)
  end

  def authenticate_admin
    unless current_user.admin?
      redirect_to root_path
    end
  end

end
