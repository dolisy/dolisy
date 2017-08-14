require 'csv'

class MealRepository < BaseRepository
  def self.from_csv(row)
    row[:id]   = row[:id].to_i           # Convert column to Fixnum
    row[:price]  = row[:price].to_i          # Convert column to Fixnum
    row[:name] = row[:name].to_s         # Convert column to string

    # Create a new meal
    Meal.new(row)
  end

  def self.headers
    ['id', 'name', 'price']
  end
end





