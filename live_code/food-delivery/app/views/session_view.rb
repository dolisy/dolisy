class SessionView
  def ask_for(something)
    puts "#{something}?"
    print "> "
    gets.chomp
  end
end
