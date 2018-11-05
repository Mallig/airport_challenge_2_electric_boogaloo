require 'airport'

describe Airport do
  let(:mockPlane) { double :aeroplane }

  context 'when weather is clear' do
    before(:each) do
      allow(subject).to receive(:weather) { "clear" }
    end

    context 'when airport is not full' do
      context 'when plane is in the hangar' do
        describe '.store' do
          it 'raises an error' do
            expect { subject.store(mockPlane) }
              .to raise_error "Plane already in hangar"
          end
        end

        describe '.remove' do
          it 'removes the plane from the hangar' do
            subject.store(mockPlane)
            expect(subject.remove(mockPlane))
              .not_to include(mockPlane)
          end
        end
      end

      context 'when plane is not in hangar' do
        describe '.store' do
          it 'stores the plane in its hangar' do
            expect(subject.store(mockPlane))
              .to include(mockPlane)
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
        Airport::DEFAULTCAPACITY.times do
          subject.store(mockPlane)
        end
      end

      it 'prevents planes from landing' do
        expect { subject.store(mockPlane) }
          .to raise_error 'Airport Full, no space to land'
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

  it 'has a default capacity which can be overridden' do
    capacity = 10
    subject = Airport.new(capacity)
    allow(subject).to receive(:weather) { 'clear' }
    capacity.times do
      subject.store(mockPlane)
    end
    expect { subject.store(mockPlane) }
      .to raise_error 'Airport Full, no space to land'
  end
end
