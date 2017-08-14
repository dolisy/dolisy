class Employee
  attr_writer :id
  attr_reader :username, :password
  def initialize(attributes = {})
    @id = attributes[:id]
    @username = attributes[:username]
    @password = attributes[:password]
  end

  def to_csv
    [@id, @username, @password]
  end
end
