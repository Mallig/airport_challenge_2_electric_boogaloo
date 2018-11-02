class Aeroplane
  def land(airport)
    airport.store(self)
    "plane has landed at airport"
  end

  def takeoff(airport)
    airport.remove(self)
    "plane has left airport"
  end
end
