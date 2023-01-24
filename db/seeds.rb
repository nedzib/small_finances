# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user_test = User.create!(email: "nedzib@gmail.com", password: "password", password_confirmation: "password")

# Type.create!(name: "Gastos Fijos", operator: "subtract", color: "#424242", user: user_test)
# Type.create!(name: "Egresos", operator: "subtract", color: "#ba5422", user: user_test)
# Type.create!(name: "Deudas", operator: "subtract", color: "#ff0000", user: user_test)
# Type.create!(name: "Ingresos", operator: "addition", color: "#00ff44", user: user_test)
#
# Month.create!(active: false, period: "01-12-2022".to_date, total_debt: 2000, final_balance: 1000, user: user_test)
# Month.create!(active: true, period: "01-01-2023".to_date, user: user_test)