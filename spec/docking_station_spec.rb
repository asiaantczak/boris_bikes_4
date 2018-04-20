require 'docking_station'

describe DockingStation do

  let(:broken_bike) {instance_double Bike, working?: false}
  let(:working_bike) {instance_double Bike, working?: true}

  describe '#dock' do
    it 'raises error if docking station is full' do
      DockingStation::DEFAULT_CAPACITY.times { subject.dock(working_bike) }
      expect { subject.dock(working_bike) }.to raise_error 'docking station is full'
    end

    it 'docks something' do
      expect(subject.dock(working_bike)).to eq [working_bike]
    end

    it 'docks broken bike' do
      subject.dock(broken_bike)
      expect(subject.bikes).to eq [broken_bike]
    end

    it 'returns docked bikes' do
      subject.dock(working_bike)
      expect(subject.bikes).to eq [working_bike]
    end
  end

  describe '#release_bike' do
    it 'returns a working bike' do
        subject.dock(working_bike)
        expect(subject.release_bike).to be_working
    end

    it 'releases a bike' do
      subject.dock(working_bike)
      expect(subject.release_bike).to eq working_bike
    end

    it 'raises error if no bikes available' do
      expect { subject.release_bike }.to raise_error 'no bikes available'
    end

    it 'wont release broken bikes' do
      subject.dock(broken_bike)
      expect { subject.release_bike }.to raise_error 'no bikes available'
    end

    it 'releases working bikes behind broken bikes' do
      subject.dock(working_bike)
      subject.dock(broken_bike)
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
