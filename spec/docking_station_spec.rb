require 'docking_station'

describe DockingStation do

  it { is_expected.to respond_to(:release_bike) }

  it { is_expected.to respond_to(:dock).with(1).argument }

  it 'returns a working bike' do
      bike = subject.release_bike
      expect(bike).to be_working
  end

  it { is_expected.to respond_to(:bike) }

  it 'docks something' do
    bike  = Bike.new
    expect(subject.dock(bike)).to eq bike
<<<<<<< HEAD
=======
  end

  it 'returns docked bikes' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bike).to eq bike
>>>>>>> 590e7af9ee2fbabd240fae9143c202eb5d6fcf9b
  end

  it 'raises error if no bike available' do
      expect(subject.release_bike).to raise_error("no bikes available")
  end

end
