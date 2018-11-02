class Airport
  def initialize
    @hangar = []
  end

  def store(plane)
    @hangar.push(plane)
  end

  def remove(plane)
    @hangar.delete(plane)
    @hangar
  end
end
