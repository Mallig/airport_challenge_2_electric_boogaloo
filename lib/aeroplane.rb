class Aeroplane
  def initialize
    @landed = false
  end

  def land(airport)
    raise 'Plane has already landed' if @landed
    airport.store(self)
    @landed = true
    "plane has landed at airport"
  end

  def takeoff(airport)
    raise 'Plane is already in the air' unless @landed
    airport.remove(self)
    @landed = false
    "plane has left airport"
  end
end
