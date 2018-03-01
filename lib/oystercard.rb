require './lib/journey.rb'
class Oystercard

  MAXIMUM_BALANCE = 90
  MINIMUM_FARE = 1

  attr_reader :balance, :entry_station, :journey_history, :journey

  def initialize(journey_class = Journey)
    @balance = 0.0
    @entry_station = nil
    @journey_history = []
  end

  def top_up(amount)
    raise Exception.new("Maximum balance of £#{MAXIMUM_BALANCE} exceeded!") if @balance + amount > MAXIMUM_BALANCE
    @balance += amount
  end

  def touch_in(station)
    raise Exception.new("Minimum balance for travel is £#{MINIMUM_FARE}") if @balance < MINIMUM_FARE
    if journey != nil
      deduct(journey.fare)
      @journey_history.push(journey)
    end
      @journey = Journey.new(station)
      @entry_station = station
  end

  def touch_out(station)
    @journey = Journey.new if journey == nil
    journey.finish(station)
    deduct(journey.fare)
    @journey_history.push(journey)
    @journey = @entry_station = nil
  end

  def in_journey?
    !!entry_station
  end

  private

  def deduct(fare)
    @balance -= fare
  end

end
