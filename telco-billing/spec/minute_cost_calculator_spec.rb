require 'rspec'
require_relative '../app/model/call_cost_calculator/minute_cost_calculator.rb'

describe 'MinuteCostCalculator' do
  let(:minute_cost_calculator) { MinuteCostCalculator.new(2.5) }

  it 'At start, cost is 0 because the quantity of minutes is 0' do
    expect(minute_cost_calculator.cost).to eq 0
  end

  it 'Within one minute, cost is 2.5 because the quantity of minutes is 1' do
    minute_cost_calculator.inc
    expect(minute_cost_calculator.cost).to eq 2.5
  end

  it 'Ignoring the first minute, the cost is 0' do
    minute_cost_calculator.inc
    free_minutes = 1
    expect(minute_cost_calculator.cost(free_minutes)).to eq 0
  end

  it 'Increment two times, first ignore one, then check that if not ignoring the counter was not affected' do
    minute_cost_calculator.inc
    minute_cost_calculator.inc
    free_minutes = 1
    expect(minute_cost_calculator.cost(free_minutes)).to eq 2.5
    expect(minute_cost_calculator.cost).to eq 5
  end
end
