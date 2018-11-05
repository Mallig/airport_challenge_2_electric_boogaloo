require 'airport'

describe Airport do
  let(:mockPlane) { double :aeroplane }
  let(:mockAnotherPlane) { double :aeroplane }

  context 'when weather is clear' do
    before(:each) do
      allow(subject).to receive(:report) { :clear }
    end

    context 'when airport is not full' do
      context 'when plane is in the hangar' do
        describe '.store' do
          it 'raises an error' do
            subject.store(mockPlane)
            expect { subject.store(mockPlane) }
              .to raise_error "Plane already in hangar"
          end
        end

        describe '.remove' do
          it 'removes the plane from the hangar' do
            subject.store(mockPlane)
            expect(subject.remove(mockPlane)).not_to include(mockPlane)
          end
        end
      end

      context 'when plane is not in hangar' do
        describe '.store' do
          it 'stores the plane in its hangar' do
            expect(subject.store(mockPlane)).to include(mockPlane)
          end
        end

        describe '.remove' do
          it 'raises an error' do
            expect { subject.remove(mockPlane) }
              .to raise_error "Plane not in hangar"
          end
        end
      end
    end

    context 'when airport is full' do
      before(:each) do
        capacity = 1
        @small_airport = Airport.new(capacity)
        allow(@small_airport).to receive(:report) { :clear }
        @small_airport.store(mockPlane)
      end

      it 'prevents planes from landing' do
        expect { @small_airport.store(mockAnotherPlane) }
          .to raise_error "Airport Full, no space to land"
      end
    end
  end

  context 'when weather is stormy' do
    before(:each) do
      allow(subject).to receive(:report) { :clear }
      subject.store(mockPlane)
      allow(subject).to receive(:report) { :stormy }
    end

    it 'prevents planes from landing' do
      expect { subject.store(mockAnotherPlane) }
        .to raise_error "Stormy Weather, unsafe to land"
    end

    it 'prevents planes from taking off' do
      expect { subject.remove(mockPlane) }
        .to raise_error "Stormy Weather, unsafe to take off"
    end
  end

  it 'has a default capacity which can be overridden' do
    capacity = 1
    subject = Airport.new(capacity)
    allow(subject).to receive(:report) { :clear }
    subject.store(mockPlane)
    
    expect { subject.store(mockAnotherPlane) }
      .to raise_error "Airport Full, no space to land"
  end
end
