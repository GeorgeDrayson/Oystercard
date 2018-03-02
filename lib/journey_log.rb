require 'journey'

class JourneyLog

  attr_accessor :history, :journey

  def initialize(journey_class = Journey)
    @history = []
    @journey = nil
    @journey_class = journey_class
  end

  def start(station)
    history.push(journey) if journey != nil
    @journey = @journey_class.new(station)
  end

  def finish(station)
    @journey = @journey_class.new if journey == nil
    journey.finish(station)
    history.push(journey)
    @journey = nil
  end
end
