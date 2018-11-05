module WeatherStation
  def report(kernel = Kernel)
    kernel.rand() < 0.8 ? "clear" : "stormy"
  end
end
