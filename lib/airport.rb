class Airport
  def initialize
    @hangar = []
  end

  def store(plane)
    raise 'Stormy Weather, unsafe to land' if weather == 'stormy'
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
end
