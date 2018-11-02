require 'airport'

describe Airport do
  let(:mockPlane) { double :aeroplane }
  describe '.store' do
    it 'stores provided argument in its hangar' do
      expect(subject.store(mockPlane))
        .to include(mockPlane)
    end
  end

  describe '.remove' do
    it 'removes provided argument from the hangar' do
      subject.store(mockPlane)
      expect(subject.remove(mockPlane))
        .not_to include(mockPlane)
    end
  end
end
