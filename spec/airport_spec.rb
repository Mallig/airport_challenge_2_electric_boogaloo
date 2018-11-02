require 'airport'

describe Airport do
  let(:mockPlane) { double :aeroplane }
  
  context 'when weather is clear' do
    before(:each) do
      allow(subject).to receive(:weather) { "clear" }
    end

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

  context 'when weather is stormy' do
    before(:each) do
      allow(subject).to receive(:weather) { "stormy" }
    end

    it 'prevents planes from landing' do
      expect { subject.store(mockPlane) }
        .to raise_error "Stormy Weather, unsafe to land"
    end

    it 'prevents planes from taking off' do
      expect { subject.remove(mockPlane) }
        .to raise_error "Stormy Weather, unsafe to take off"
    end
  end
end
