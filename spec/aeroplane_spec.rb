require 'aeroplane'

describe Aeroplane do
  let(:mockAirport) { double :airport}
  describe '.land' do
    it 'lands the plane at an airport' do
      expect(subject.land(mockAirport))
        .to eq "plane has landed at airport"
    end
  end
end
