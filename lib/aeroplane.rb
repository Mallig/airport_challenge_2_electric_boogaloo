class Aeroplane
  def land(airport)
    airport.store(self)
    "plane has landed at airport"
  end

  def takeoff(_airport)
    "plane has left airport"
  end
end
