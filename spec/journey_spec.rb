require 'journey'

describe Journey do

  let(:station) {double :station, zone: 1}

  penalty_fare = Journey::PENALTY_FARE
  minimum_fare = Journey::MINIMUM_FARE

  it "is able to tell if a journey is complete or not" do
    expect(subject).not_to be_complete
  end

  it 'has a penalty fare for edge cases' do
    expect(subject.fare).to eq(penalty_fare)
  end

  context 'given an entry station' do
    subject {described_class.new(station)}

    it 'has an entry station' do
      expect(subject.entry_station).to eq station
    end

    it "returns a penalty fare if no exit station given" do
      expect(subject.fare).to eq penalty_fare
    end

     context 'given an exit station' do
       let(:different_station) { double :different_station, zone: 3 }

       before do
         subject.finish(different_station)
       end

       it 'calculates a fare' do
         expect(subject.fare).to eq 3
       end

       it "knows if a journey is complete" do
         expect(subject).to be_complete

       end
     end
     context 'second fare test' do
       let(:different_station) { double :different_station2, zone: 1 }

       before do
         subject.finish(different_station)
       end

       it 'calculates a fare' do
         expect(subject.fare).to eq 1
       end

     end
   end
end
