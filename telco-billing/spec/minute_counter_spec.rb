require 'rspec'
require_relative '../app/model/minutes/minute_counter.rb'

describe 'LocalCallWeekDayMinuteCounter' do
  let(:minuteCounter) { MinuteCounter.new(2.5) }

  it 'At start, cost is 0 because the quantity of minutes is 0' do
    expect(minuteCounter.cost).to eq 0
  end
end
