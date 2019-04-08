require 'rspec'
require_relative '../app/model/call/international_call'
require_relative '../app/model/phone'
require 'rspec/mocks'
describe 'InternationalCall' do
  it 'international call call to NA of 1 minute' do
    params = { 'start' => '20190211;14:30', 'end' => '20190211;14:31',
               'origin' => instance_double('phone'), 'destination' => Phone.new('52 011 5555 6666') }
    international_call = InternationalCall.new(params)
    expect(international_call.cost).to eq 10
  end
  it 'international call call to NA of 2 minutes' do
    params = { 'start' => '20190211;14:30', 'end' => '20190211;14:32',
               'origin' => instance_double('phone'), 'destination' => Phone.new('52 011 5555 6666') }
    international_call = InternationalCall.new(params)
    expect(international_call.cost).to eq 20
  end
  it 'international call call to rest of america of 1 minute' do
    params = { 'start' => '20190211;14:30', 'end' => '20190211;14:31',
               'origin' => instance_double('phone'), 'destination' => Phone.new('55 011 5555 6666') }
    international_call = InternationalCall.new(params)
    expect(international_call.cost).to eq 6
  end
  it 'international call call to rest of america of 2 minutes' do
    params = { 'start' => '20190211;14:30', 'end' => '20190211;14:32',
               'origin' => instance_double('phone'), 'destination' => Phone.new('55 011 5555 6666') }
    international_call = InternationalCall.new(params)
    expect(international_call.cost).to eq 12
  end
  it 'international call call to rest of world of 1 minute' do
    params = { 'start' => '20190211;14:30', 'end' => '20190211;14:31',
               'origin' => instance_double('phone'), 'destination' => Phone.new('39 011 5555 6666') }
    international_call = InternationalCall.new(params)
    expect(international_call.cost).to eq 15
  end
  it 'international call call to rest of world of 2 minutes' do
    params = { 'start' => '20190211;14:30', 'end' => '20190211;14:32',
               'origin' => instance_double('phone'), 'destination' => Phone.new('39 011 5555 6666') }
    international_call = InternationalCall.new(params)
    expect(international_call.cost).to eq 30
  end
end
