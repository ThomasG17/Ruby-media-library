class CartController < ApplicationController
  before_action :set_cart, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @cart = Cart.new
  end

  def edit
  end

  def create
    @cart = Cart.new(cart_params)
    if @cart.save
      redirect_to root_path
    end
  end

  def update
    if @cart.update(cart_params)
      redirect_to cart_path(params[:id])
    end
  end

  def destroy
  end

private
  def set_cart
    @cart = Cart.find(params[:id])
  end

  def cart_params
    params.require(:cart).permit(:user_id)
  end
end
