require './lib/weather_station.rb'

class Airport
  include WeatherStation
  DEFAULTCAPACITY = 200

  def initialize(capacity = DEFAULTCAPACITY)
    @hangar = []
    @capacity = capacity
  end

  def store(plane)
    raise 'Stormy Weather, unsafe to land' if weather == 'stormy'
    raise 'Airport Full, no space to land' if hangar_full?

    @hangar.push(plane)
  end

  def remove(plane)
    raise 'Stormy Weather, unsafe to take off' if weather == 'stormy'

    @hangar.delete(plane)
    @hangar
  end

  private

  def weather
    self.report
  end

  def hangar_full?
    @hangar.length == @capacity
  end
end
