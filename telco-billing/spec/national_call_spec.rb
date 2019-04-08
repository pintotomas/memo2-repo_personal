require 'rspec'
require_relative '../app/model/call/national_call'

describe 'NationalCall' do
  it 'National call of 1 minute cost' do
    national_call = NationalCall.new('20190211;14:30', '20190211;14:31')
    expect(national_call.cost).to eq 20
  end
  it 'National call of 5 minutes' do
    national_call = NationalCall.new('20190211;14:30', '20190211;14:35')
    expect(national_call.cost).to eq 20
  end
  it 'National call of 6 minutes' do
    national_call = NationalCall.new('20190211;14:30', '20190211;14:36')
    expect(national_call.cost).to eq 21.5
  end
  it 'National call of 15 minutes' do
    national_call = NationalCall.new('20190211;14:30', '20190211;14:45')
    expect(national_call.cost).to eq 35
  end
end
