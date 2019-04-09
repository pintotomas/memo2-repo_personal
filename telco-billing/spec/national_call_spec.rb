require 'rspec'
require_relative '../app/model/call/national_call'
require_relative '../app/model/phone'
require_relative '../app/model/call_cost_calculator/call_cost_calculator'

describe 'NationalCall' do
  let(:cost_calculator) { CallCostCalculator.new }

  it 'National call of 1 minute cost' do
    national_call = NationalCall.new(Phone.new('54 011 5555 6666'), Phone.new('54 314 5555 6666'), '20190211;14:30', '20190211;14:31')
    expect(cost_calculator.cost(national_call)).to eq 20
  end
  it 'National call of 5 minutes' do
    national_call = NationalCall.new(Phone.new('54 011 5555 6666'), Phone.new('54 314 5555 6666'), '20190211;14:30', '20190211;14:35')
    expect(cost_calculator.cost(national_call)).to eq 20
  end
  it 'National call of 6 minutes' do
    national_call = NationalCall.new(Phone.new('54 011 5555 6666'), Phone.new('54 314 5555 6666'), '20190211;14:30', '20190211;14:36')
    expect(cost_calculator.cost(national_call)).to eq 21.5
  end
  it 'National call of 15 minutes' do
    national_call = NationalCall.new(Phone.new('54 011 5555 6666'), Phone.new('54 314 5555 6666'), '20190211;14:30', '20190211;14:45')
    expect(cost_calculator.cost(national_call)).to eq 35
  end
end
