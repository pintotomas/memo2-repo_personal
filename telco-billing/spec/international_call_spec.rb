require 'rspec'
require_relative '../app/model/call/international_call'
require_relative '../app/model/phone'
require_relative '../app/model/call_cost_calculator/call_cost_calculator'
require 'rspec/mocks'
describe 'InternationalCall' do
  let(:cost_calculator) { CallCostCalculator.new }

  it 'international call call to NA of 1 minute' do
    international_call = InternationalCall.new(Phone.new('54 011 5555 6666'), Phone.new('52 011 5555 6666'), '20190211;14:30', '20190211;14:31')
    expect(cost_calculator.cost(international_call)).to eq 10
  end
  it 'international call call to NA of 2 minutes' do
    international_call = InternationalCall.new(Phone.new('54 011 5555 6666'), Phone.new('52 011 5555 6666'), '20190211;14:30', '20190211;14:32')
    expect(cost_calculator.cost(international_call)).to eq 20
  end
  it 'international call call to rest of america of 1 minute' do
    international_call = InternationalCall.new(Phone.new('54 011 5555 6666'), Phone.new('55 011 5555 6666'), '20190211;14:30', '20190211;14:31')
    expect(cost_calculator.cost(international_call)).to eq 6
  end
  it 'international call call to rest of america of 2 minutes' do
    international_call = InternationalCall.new(Phone.new('54 011 5555 6666'), Phone.new('55 011 5555 6666'), '20190211;14:30', '20190211;14:32')
    expect(cost_calculator.cost(international_call)).to eq 12
  end
  it 'international call call to rest of world of 1 minute' do
    international_call = InternationalCall.new(Phone.new('54 011 5555 6666'), Phone.new('39 011 5555 6666'), '20190211;14:30', '20190211;14:31')
    expect(cost_calculator.cost(international_call)).to eq 15
  end
  it 'international call call to rest of world of 2 minutes' do
    international_call = InternationalCall.new(Phone.new('54 011 5555 6666'), Phone.new('39 011 5555 6666'), '20190211;14:30', '20190211;14:32')
    expect(cost_calculator.cost(international_call)).to eq 30
  end
end
