require 'rspec'
require_relative '../app/model/call/international_call'

describe 'InternationalCall' do
  it 'international call call to NA of 1 minute' do
    international_call = InternationalCall.new('20190211;14:30', '20190211;14:31', '52')
    expect(international_call.cost).to eq 10
  end
  it 'international call call to NA of 2 minutes' do
    international_call = InternationalCall.new('20190211;14:30', '20190211;14:32', '52')
    expect(international_call.cost).to eq 20
  end
  it 'international call call to rest of america of 1 minute' do
    international_call = InternationalCall.new('20190211;14:30', '20190211;14:31', '55')
    expect(international_call.cost).to eq 6
  end
  it 'international call call to rest of america of 2 minutes' do
    international_call = InternationalCall.new('20190211;14:30', '20190211;14:32', '55')
    expect(international_call.cost).to eq 12
  end
end
