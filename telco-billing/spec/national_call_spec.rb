require 'rspec'
require_relative '../app/model/call/national_call'
require 'rspec/mocks'

describe 'NationalCall' do
  it 'National call of 1 minute cost' do
    params = { 'start' => '20190211;14:30', 'end' => '20190211;14:31', 'origin' => instance_double('phone') }
    national_call = NationalCall.new(params)
    expect(national_call.cost).to eq 20
  end
  it 'National call of 5 minutes' do
    params = { 'start' => '20190211;14:30', 'end' => '20190211;14:35', 'origin' => instance_double('phone') }
    national_call = NationalCall.new(params)
    expect(national_call.cost).to eq 20
  end
  it 'National call of 6 minutes' do
    params = { 'start' => '20190211;14:30', 'end' => '20190211;14:36', 'origin' => instance_double('phone') }
    national_call = NationalCall.new(params)
    expect(national_call.cost).to eq 21.5
  end
  it 'National call of 15 minutes' do
    params = { 'start' => '20190211;14:30', 'end' => '20190211;14:45', 'origin' => instance_double('phone') }
    national_call = NationalCall.new(params)
    expect(national_call.cost).to eq 35
  end
end
