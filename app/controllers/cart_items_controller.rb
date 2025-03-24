class CartItemsController < ApplicationController

  def index
    @cart_items = current_user.cart_items
  end

  def create
    cart_item = current_user.cart_items.find_by(product_id: params[:product_id])

    if cart_item
      cart_item.increment(:quantity)
    else
      current_user.cart_items.create(product_id: params[:product_id], quantity: 1)  # Создаем новый товар в корзине
    end

    redirect_to products_path, notice: "Товар добавлен в корзину!"
  end

  def destroy
    if current_user.cart_items.find(params[:id]).destroy
      flash[:notice] = "Товар удален из корзины!"
    else
      flash[:alert] = "Ошибка"
    end

    redirect_to cart_items_path
  end
end
