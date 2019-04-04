require_relative 'bike'
class DockingStation
  attr_reader :bikes, :capacity
  attr_writer :capacity
  DEFAULT_CAPACITY = 20
  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    raise 'No bikes available!' if empty?
    raise 'No working bikes available!' if no_working_bikes
    @bikes
  end

  def dock_bike(bike)
    raise 'No space available!' if full?
    @bikes << bike
  end

  def release_broken_bike
    @bikes.select{ |bike| bike.broken? }
  end
  
  private

  def full?
    @bikes.count >= DEFAULT_CAPACITY
  end

  def empty?
    @bikes.empty?
  end

  def no_working_bikes
    @bikes.select{ |bike| bike.working? }.empty?
  end
end
