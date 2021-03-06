class CartItemsController < ApplicationController
  before_action :set_cart_item, only: [:destroy]

  # POST /cart_items
  def create
    @cart.add_product(params)

    unless @cart.save
      flash[:error] = 'Возникла проблема, попробуйте снова'
      redirect_back fallback_location: root_path
    end

  end

  def update
    @cart_item = CartItem.where(product_id: params[:id], product_type: params[:product_type]).last
    @cart_item.update_cart_item(params)
  end

  # DELETE /cart_items/1
  def destroy
    @cart.remove_product(@cart_item.product_id, @cart_item.product_type)
    redirect_back fallback_location: root_path
  end

  private
  def set_cart_item
    @cart_item = CartItem.find(params[:id])
  end
end
