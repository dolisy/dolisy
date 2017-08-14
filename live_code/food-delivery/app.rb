require_relative 'app/repositories/base_repository'
require_relative 'app/repositories/meal_repository'
require_relative 'app/repositories/employee_repository'
require_relative 'app/models/meal'
require_relative 'app/models/employee'
require_relative 'app/models/manager'
require_relative 'app/models/delivery_guy'
require_relative 'app/controllers/meals_controller'
require_relative 'app/controllers/sessions_controller'
require_relative 'app/views/meal_view'
require_relative 'app/views/session_view'
require_relative 'router'
require 'byebug'

meal_repo = MealRepository.new("data/meals.csv")
# meal = Meal.new(name: "Pizza", price: 10)

# manager = Manager.new(username: "John", password: "secret")
# delivery_guy = DeliveryGuy.new(username: "otherjohn", password: "othersecret")

employee_repo = EmployeeRepository.new("data/employees.csv")
# employee_repo.add(manager)
# employee_repo.add(delivery_guy)

# repo.add(meal)
# repo.add(Meal.new(name: 'Pasta', price: 5))
# p repo

# controller = MealsController.new(repo)
# controller.list
# controller.create
# controller.list

# p employee_repo


Router.new({
  meals: MealsController.new(meal_repo),
  sessions: SessionsController.new(employee_repo)
}).run




