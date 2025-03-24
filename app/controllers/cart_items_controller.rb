class CartItemsController < ApplicationController

  def index
    @cart_items = current_user.cart_items
  end

  def update
    @cart = current_user.cart
    product = Product.find(params[:product_id])
    cart_item = @cart.cart_items.find_or_initialize_by(product: product)

    if params[:quantity].to_i > 0
      cart_item.quantity = params[:quantity].to_i
      cart_item.save
    else
      cart_item.destroy
    end

    respond_to do |format|
      format.turbo_stream
    end
  end

  def clear
    @cart = current_user.cart
    @cart.cart_items.destroy_all

    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.replace("cart", partial: "carts/cart", locals: { cart: @cart }) }
    end
  end

  def create
    # Проверка, есть ли товар уже в корзине пользователя
    cart_item = current_user.cart_items.find_by(product_id: params[:product_id])

    if cart_item
      cart_item.increment_quantity!
    else
      current_user.cart_items.create(product_id: params[:product_id], quantity: 1)  # Создаем новый товар в корзине
    end

    redirect_to products_path, notice: "Товар добавлен в корзину!"
  end
end