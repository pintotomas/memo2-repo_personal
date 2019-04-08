require 'rspec'
require_relative '../app/model/minutes/minute_counter.rb'

describe 'MinuteCOunter' do
  let(:minuteCounter) { MinuteCounter.new(2.5) }

  it 'At start, cost is 0 because the quantity of minutes is 0' do
    expect(minuteCounter.cost).to eq 0
  end

  it 'Within one minute, cost is 2.5 because the quantity of minutes is 1' do
    minuteCounter.inc
    expect(minuteCounter.cost).to eq 2.5
  end

  it 'Ignoring the first minute, the cost is 0' do
    minuteCounter.inc
    minutes_ignored = 1
    expect(minuteCounter.cost(minutes_ignored)).to eq 0
  end

  it 'Increment two times, first ignore one, then check that if not ignoring the counter was not affected' do
    minuteCounter.inc
    minuteCounter.inc
    minutes_ignored = 1
    expect(minuteCounter.cost(minutes_ignored)).to eq 2.5
    expect(minuteCounter.cost).to eq 5
  end
end
