require 'docking_station'

describe DockingStation do
  let(:bike) {Bike.new}

  describe '#dock' do
    it 'raises error if docking station is full' do
      DockingStation::DEFAULT_CAPACITY.times { subject.dock(bike) }
      expect { subject.dock(bike) }.to raise_error 'docking station is full'
    end

    it 'docks something' do
      expect(subject.dock(bike)).to eq [bike]
    end

    it 'returns docked bikes' do
      subject.dock(bike)
      expect(subject.bikes).to eq [bike]
    end
  end

  describe '#release_bike' do
    it 'returns a working bike' do
        subject.dock(bike)
        expect(subject.release_bike).to be_working
    end

    it 'releases a bike' do
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

    it 'raises error if no bikes available' do
      expect { subject.release_bike }.to raise_error 'no bikes available'
    end

    it 'wont release broken bikes' do
      tricycle = bike
      tricycle.report_broken
      subject.dock(tricycle)
      expect { subject.release_bike }.to raise_error 'no bikes available'
    end

    it 'releases working bikes behind broken bikes' do
      bike1 = Bike.new
      bike2 = Bike.new
      bike2.report_broken
      subject.dock(bike1)
      subject.dock(bike2)
      released_bike = subject.release_bike
      expect(released_bike).to be_working
    end
  end

  describe '#capacity' do
    it {is_expected.to respond_to(:capacity)}

    it 'set capacity to default value' do
      expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
    end
  end
end
