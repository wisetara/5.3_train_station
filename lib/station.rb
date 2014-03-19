require 'pg'

#DB = PG.connect({:dbname => 'train_system'})
#
class Station

  attr_reader :name, :id

  def initialize(attributes)
    @name = attributes[:name]
    @id = attributes[:id]
  end

  def ==(another_station)
    self.name == another_station.name
  end

  def self.all
    results = DB.exec("SELECT * FROM stations;")
    stations = []
    results.each do |result|
      name = result['name']
      stations << Station.new({:name => name})
    end
    stations
  end

  def save
    DB.exec("INSERT INTO stations (name) VALUES ('#{@name}');")
  end
end
