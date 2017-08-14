class MealsController
  def initialize(repository)
    @repository = repository
    @view = MealView.new
  end

  def list
    # Fetch all meals
    meals = @repository.all
    # Display them through the view
    @view.display_all(meals)
  end

  def create
    # Ask the user for the name/price of a new meal
    attributes = @view.ask_for_meal_attributes
    # Create the new meal object
    meal = Meal.new(attributes)
    # Add it to the repository
    @repository.add(meal)
  end
end
