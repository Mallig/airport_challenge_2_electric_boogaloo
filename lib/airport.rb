class Airport
  DEFAULTCAPACITY = 200

  def initialize
    @hangar = []
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
    rand() < 0.8 ?  'clear' : 'stormy'
  end

  def hangar_full?
    @hangar.length == DEFAULTCAPACITY
  end
end
