require './lib/weather_station.rb'

class Airport
  include WeatherStation
  DEFAULTCAPACITY = 200

  def initialize(capacity = DEFAULTCAPACITY)
    @hangar = []
    @capacity = capacity
  end

  def store(plane)
    raise 'Plane already in hangar' if in_hangar?(plane)
    raise 'Stormy Weather, unsafe to land' if report == 'stormy'
    raise 'Airport Full, no space to land' if hangar_full?

    @hangar.push(plane)
  end

  def remove(plane)
    raise 'Plane not in hangar' unless in_hangar?(plane)
    raise 'Stormy Weather, unsafe to take off' if report == 'stormy'

    @hangar.delete(plane)
    @hangar
  end

  private

  def hangar_full?
    @hangar.length == @capacity
  end

  def in_hangar?(plane)
    @hangar.include?(plane)
  end
end
