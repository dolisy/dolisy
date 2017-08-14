class MealView
  def display_all(list)
    list.each_with_index do |item, index|
      puts "#{index + 1} - #{item.name} (#{item.price}€)"
    end
  end

  def ask_for_meal_attributes
    attributes = {}

    puts "What is the name?"
    print "> "
    attributes[:name] = gets.chomp

    puts "What is the price?"
    print "> "
    attributes[:price] = gets.chomp

    attributes
  end
end
