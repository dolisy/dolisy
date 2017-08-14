class EmployeeRepository < BaseRepository
  def self.headers
    ['id', 'username', 'password', 'role']
  end

  def self.from_csv(row)
    row[:id]   = row[:id].to_i           # Convert column to Fixnum
    row[:username]  = row[:username].to_s          # Convert column to Fixnum
    row[:password] = row[:password].to_s         # Convert column to string

    if row[:role].to_s == "manager"
      Manager.new(row)
    else
      DeliveryGuy.new(row)
    end
  end

  def authenticate(username, password)
    found = @objects.find { |e| e.username == username && e.password == password }
    # return nil unless found
    # return nil if !found
    return if !found
    found.class
  end
end
