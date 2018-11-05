class Aeroplane
  def initialize
    @landed = false
  end

  def land(airport)
    airport.store(self)
    @landed = true
    "plane has landed at airport"
  end

  def takeoff(airport)
    airport.remove(self)
    @landed = false
    "plane has left airport"
  end
end
