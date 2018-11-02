require 'aeroplane'

describe Aeroplane do
  let(:mockAirport) { double :airport, :store => nil }

  describe '.land' do
    it 'lands the plane at an airport' do
      expect(mockAirport).to receive(:store).with(subject)
      expect(subject.land(mockAirport))
        .to eq "plane has landed at airport"
    end
  end

  describe '.takeoff' do
    it 'makes the plane leave the airport' do
      subject.land(mockAirport)
      expect(subject.takeoff(mockAirport))
        .to eq "plane has left airport"
    end
  end
end
