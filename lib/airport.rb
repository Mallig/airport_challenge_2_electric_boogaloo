require './lib/weather_station.rb'

class Airport
  include WeatherStation
  DEFAULTCAPACITY = 200

  def initialize(capacity = DEFAULTCAPACITY)
    @hangar = []
    @capacity = capacity
  end

  def store(plane)
    landing_errors(plane)

    @hangar.push(plane)
  end

  def remove(plane)
    takeoff_errors(plane)

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

  def landing_errors(plane)
    raise 'Plane already in hangar' if in_hangar?(plane)
    raise 'Stormy Weather, unsafe to land' if report == 'stormy'
    raise 'Airport Full, no space to land' if hangar_full?
  end

  def takeoff_errors(plane)
    raise 'Plane not in hangar' unless in_hangar?(plane)
    raise 'Stormy Weather, unsafe to take off' if report == 'stormy'
  end
end
