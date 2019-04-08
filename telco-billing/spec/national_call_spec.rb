require 'rspec'
require_relative '../app/model/call/national_call'

describe 'NationalCall' do
  it 'National call of 1 minute' do
    national_call = NationalCall.new('20190211;14:31', '20190211;14:32')
    expect(national_call.cost).to eq 20
  end
end
