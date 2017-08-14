class Router
  def initialize(controllers = {})
    @meals_controller = controllers[:meals]
    @sessions_controller = controllers[:sessions]
  end

  def run
    puts "Welcome!"

    role = @sessions_controller.login

    loop do
      # Print actions to user
      print_menu(role)
      # Get his action
      action = get_user_action
      # Route him to it
      route_action(role, action)
    end
  end

  def print_menu(role)
    if role == Manager
      puts "1 - List meals"
      puts "2 - Add meal"
      puts "0 - Exit"
    else
      puts "1 - List meals"
      puts "0 - Exit"
    end
  end

  def get_user_action
    puts "What now?"
    print "> "
    gets.chomp.to_i
  end

  def route_action(role, action)
    if role == Manager
      case action
      when 1 then @meals_controller.list
      when 2 then @meals_controller.add
      when 0 then stop
      end
    else
      case action
      when 1 then @meals_controller.list
      when 0 then stop
      end
    end
  end

  def stop
    puts "Bye bye"
    exit
  end
end
