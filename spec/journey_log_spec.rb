require 'journey_log'
require 'oystercard'

describe JourneyLog do

  let(:fake_station) { double :station, zone: 1}
  let(:fake_station2) {double :station, zone: 1}
  let(:journey) { double :Journey.new}

  describe "#history" do
    it "it intializes and empty array" do
      expect(subject.history).to eq []
    end

    it "return a list of journeys" do
      subject.start(fake_station)
      subject.finish(fake_station2)
      expect(subject.history[0].entry_station).to eq fake_station
      expect(subject.history[0].exit_station).to eq fake_station2
    end
  end

  describe "#start" do
    it "starts a journey" do
      expect { subject.start(fake_station) }.to change { subject.journey }.from(nil)
    end
  end

  describe "#finish" do
    it "end a journey" do
      subject.start(fake_station)
      expect { subject.finish(fake_station2) }.to change { subject.journey }.to nil
    end
  end

  describe 'journey_history edge cases' do

    let(:oystercard) { Oystercard.new }
    before(:each) { oystercard.top_up(50) }
    subject(:journey_log) { oystercard.journey_log }

    it "should add an incomplete journey when you don't touch in" do
      oystercard.touch_out(fake_station2)
      expect( journey_log.history[0].entry_station ).to eq nil
      expect( journey_log.history[0].exit_station ).to eq fake_station2
    end
    it "should add an incomplete journey when you don't touch out" do
      oystercard.touch_in(fake_station)
      oystercard.touch_in(fake_station)
      oystercard.touch_out(fake_station2)
      expect( journey_log.history[0].entry_station ).to eq fake_station
      expect( journey_log.history[0].exit_station ).to eq nil
      expect( journey_log.history[1].entry_station ).to eq fake_station
      expect( journey_log.history[1].exit_station ).to eq fake_station2
    end
    it "should add an incomplete journey when you don't touch in" do
      oystercard.touch_in(fake_station)
      oystercard.touch_out(fake_station2)
      expect( journey_log.history[0].entry_station ).to eq fake_station
      expect( journey_log.history[0].exit_station ).to eq fake_station2
    end
  end


end
