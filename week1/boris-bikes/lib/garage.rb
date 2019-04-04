class Garage
  DEFAULT_CAPACITY = 1000
  def initialize(capacity = DEFAULT_CAPACITY)
    @broken_bikes = []
    @working_bikes = []
  end

  def collect_broken_bikes(bikes)
    @broken_bikes += bikes
  end

  def release_broken_bikes
    @broken_bikes
  end

  def collect_working_bikes(bikes)
    @working_bikes += bikes
  end

  def release_working_bikes
    @working_bikes
  end
end
