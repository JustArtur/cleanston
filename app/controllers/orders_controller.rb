class OrdersController < ApplicationController
  def create
    order = current_user.orders.build

    if order.save
      current_user.cart_items.each(&:destroy)

      redirect_to products_path, notice: "Ваш заказ успешно создан!"
    else
      redirect_to cart_items_path, alert: "Не удалось создать заказ. Попробуйте еще раз."
    end
  end
end
