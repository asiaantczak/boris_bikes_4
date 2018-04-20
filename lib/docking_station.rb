require_relative './bike'

class DockingStation

  DEFAULT_CAPACITY = 20
  attr_reader :bikes, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  def release_bike
    fail 'no bikes available' if empty? || all_broken?
    working_bike = find_working_bike
    delete(working_bike)
    working_bike
  end

  def dock(bike)
    fail 'docking station is full' if full?
    @bikes << bike
  end

  private

  def find_working_bike
    @bikes.select { |bike| bike.working? }.first
  end

  def delete(bike)
    @bikes.delete(bike)
  end

  def empty?
    @bikes.length == 0
  end

  def full?
    @bikes.length == DEFAULT_CAPACITY
  end

  def all_broken?
    @bikes.select { |bike| bike.working? }.empty?
  end
end
