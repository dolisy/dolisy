class Account
  def initialize(attr = {})
    @name = attr[:name]
    @email = attr[:email]
  end
end
