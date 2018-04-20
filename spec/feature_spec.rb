require_relative '../lib/bike'
require_relative '../lib/docking_station'
require_relative '../lib/van'

def dont_release_broken_bikes
  bike = Bike.new
  station = DockingStation.new
  bike.report_broken
  station.dock(bike)
  station.release_bike
end

def dock_broken_bikes
  bike = Bike.new
  station = DockingStation.new
  bike.report_broken
  station.dock(bike)
end

def van_collects_broken_bikes
  station = DockingStation.new
  bike = Bike.new
  van = Van.new
  bike.report_broken
  station.dock(bike)
  van.collect_broken_bikes(station)
  van.bikes == [bike]
end
