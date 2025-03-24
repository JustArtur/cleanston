# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Добавление пары товаров
Product.create(name: "Телефон", description: "Последняя модель", price: 1200.00, quantity: 100)
Product.create(name: "Ноутбук", description: "Самый мощный", price: 800.00, quantity: 100)
Product.create(name: "Микроволновка", description: "Хорошо греет", price: 300.00, quantity: 100)
Product.create(name: "Какая то штука", description: "Просто удобная штука", price: 100.00, quantity: 100)

