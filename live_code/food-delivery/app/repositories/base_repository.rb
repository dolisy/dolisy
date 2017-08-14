class BaseRepository
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @objects = []
    @next_id = 1

    if File.exist?(@csv_file_path)
      load_csv
    end
  end

  def add(object)
    @objects << object
    object.id = @next_id
    @next_id += 1
    write_to_csv
  end

  def all
    @objects
  end

  def write_to_csv
    headers = self.class.headers

    CSV.open(@csv_file_path, 'w') do |csv|
      csv << headers
      @objects.each do |object|
        csv << object.to_csv
      end
    end
  end

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file_path, csv_options) do |row|
      object = self.class.from_csv(row)

      # Add it to the list of objects
      @objects << object

      # Next ID
      @next_id += 1
    end
  end
end
