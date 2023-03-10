# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user_test = User.new(email: "nedzib@gmail.com", password: "password", password_confirmation: "password")

user_test.skip_create_mins = true
user_test.save

user_group = UserGroup.create!(users: [user_test], name: "#{user_test.id}_group", active: true)

type_1 = Type.create!(name: "Gastos Fijos", operator: "subtract", color: "secondary", user_group: user_group)
type_2 = Type.create!(name: "Egresos", operator: "subtract", color: "danger", user_group: user_group)
type_3 = Type.create!(name: "Deudas", operator: "subtract", color: "warning", user_group: user_group)
type_4 = Type.create!(name: "Ingresos", operator: "addition", color: "success", user_group: user_group)

month_dic = Month.create!(active: false, period: "01-12-2022".to_date, total_debt: 2000, final_balance: 1000, user_group: user_group)
month_jan = Month.create!(active: true, period: "01-01-2023".to_date, user_group: user_group)

MonthLine.create!(month: month_dic, type: type_4, concept: "Salario Bug", value: 3000)
MonthLine.create!(month: month_dic, type: type_3, concept: "Prestamo", value: 2000, paid: true)

MonthLine.create!(month: month_jan, type: type_4, concept: "Salario Bug", value: 3000)
MonthLine.create!(month: month_jan, type: type_3, concept: "Prestamo", value: 250, paid: true)
MonthLine.create!(month: month_jan, type: type_2, concept: "Luz", value: 20)
MonthLine.create!(month: month_jan, type: type_1, concept: "Arriendo", value: 200)