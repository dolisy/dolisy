class SessionsController
  def initialize(employee_repository)
    @employee_repository = employee_repository
    @session_view = SessionView.new
  end

  def login
    # Ask for the username
    username = @session_view.ask_for("Username")
    # Ask for the password
    password = @session_view.ask_for("Password")

    result = @employee_repository.authenticate(username, password)

    result || login
  end
end
