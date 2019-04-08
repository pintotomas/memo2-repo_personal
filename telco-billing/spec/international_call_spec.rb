require 'rspec'
require_relative '../app/model/call/international_call'

describe 'InternationalCall' do
  it 'international call call to NA of 1 minute' do
    international_call = InternationalCall.new('20190211;14:30', '20190211;14:31', '52')
    expect(international_call.cost).to eq 10
  end
end
