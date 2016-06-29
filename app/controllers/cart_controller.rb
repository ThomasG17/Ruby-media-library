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
    @cart = Cart.new(current_user.id)
    if @cart.save
      redirect_to root_path
    end
  end

  def update
    respond_to do |format|
      if @cart.update(cart_params)
        format.html { redirect_to @cart, notice: 'Role was successfully updated.' }
        format.json { render :show, status: :ok, location: @cart }
      else
        format.html { render :edit }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
  end

private
  def set_cart
    @cart = Cart.find(params[:id])
  end

  def role_params
    params.require(:cart).permit(:user_id)
  end
end
