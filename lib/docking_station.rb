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
    @bikes.pop
  end

  def dock(bike)
    fail 'docking station is full' if full?
    @bikes << bike
  end

  private

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
