require_relative '../lib/bike'
require_relative '../lib/docking_station'

def dont_release_broken_bikes
  bike = Bike.new
  station = DockingStation.new
  bike.report_broken
  station.dock(bike)
  station.release_bike
end
