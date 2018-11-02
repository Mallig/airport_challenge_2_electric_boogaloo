require 'airport'

describe Airport do
  let(:mockPlane) { double :aeroplane }
  describe '.store' do
    it 'stores provided argument in its hangar' do
      expect(subject.store(mockPlane))
        .to eq [mockPlane]
    end
  end
end
