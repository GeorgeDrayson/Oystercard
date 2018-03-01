require 'journey'

class JourneyLog

  attr_accessor :history, :journey

  def initialize
    @history = []
    @journey = nil
  end

  def start(station)
    @history.push(@journey) if @journey != nil
    @journey = Journey.new(station)
  end

  def finish(station)
    @journey = Journey.new if journey == nil
    @journey.finish(station)
    @history.push(@journey)
    @journey = nil
  end
end
