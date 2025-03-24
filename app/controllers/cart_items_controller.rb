class CartItemsController < ApplicationController
  before_action :set_cart_item, only: %i[destroy update_quantity]

  def index
    @cart_items = current_user.cart_items
  end

  def create
    cart_item = current_user.cart_items.find_by(product_id: params[:product_id])

    if cart_item
      cart_item.increment(:quantity)
    else
      current_user.cart_items.create(product_id: params[:product_id], quantity: 1) # Создаем новый товар в корзине
    end

    redirect_to products_path, notice: "Товар добавлен в корзину!"
  end

  def destroy
    if @cart_item.destroy
      flash[:notice] = "Товар удален из корзины!"
    else
      flash[:alert] = "Ошибка"
    end

    redirect_to cart_items_path
  end

  def update_quantity
    new_quantity = @cart_item.quantity + params[:change].to_i

    if new_quantity > 0
      @cart_item.update(quantity: new_quantity)
      flash[:notice] = "Количество товара обновлено."
    else
      @cart_item.destroy
      flash[:alert] = "Товар удален из корзины."
    end

    redirect_to cart_items_path
  end

  private

  def set_cart_item
    @cart_item = current_user.cart_items.find(params[:id])
  end
end
