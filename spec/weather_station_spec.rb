require 'weather_station'

class MockAirport 
  include WeatherStation
end

module MockKernelLowRand
  def self.rand
    0.1
  end
end

module MockKernelHighRand
  def self.rand
    0.9
  end
end

describe WeatherStation do
  describe '.report' do
    before(:each) do
      @mock_airport = MockAirport.new
    end

    context 'when Kernel.rand returns lower than 0.8' do
      it 'returns weather status of :clear' do
        expect(@mock_airport.report(MockKernelLowRand)).to eq :clear
      end
    end

    context 'when Kernel.rand returns greater than 0.8' do
      it 'returns weather status of :stormy' do
        expect(@mock_airport.report(MockKernelHighRand)).to eq :stormy
      end
    end
  end
end
