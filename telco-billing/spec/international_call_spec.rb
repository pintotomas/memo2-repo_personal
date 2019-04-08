require 'rspec'
require_relative '../app/model/call/international_call'
require_relative '../app/model/phone'
require 'rspec/mocks'
describe 'InternationalCall' do
  it 'international call call to NA of 1 minute' do
    international_call = InternationalCall.new('20190211;14:30', '20190211;14:31', instance_double('phone'), Phone.new('52 011 5555 6666'))
    expect(international_call.cost).to eq 10
  end
  it 'international call call to NA of 2 minutes' do
    international_call = InternationalCall.new('20190211;14:30', '20190211;14:32', instance_double('phone'), Phone.new('52 011 5555 6666'))
    expect(international_call.cost).to eq 20
  end
  it 'international call call to rest of america of 1 minute' do
    international_call = InternationalCall.new('20190211;14:30', '20190211;14:31', instance_double('phone'), Phone.new('55 011 5555 6666'))
    expect(international_call.cost).to eq 6
  end
  it 'international call call to rest of america of 2 minutes' do
    international_call = InternationalCall.new('20190211;14:30', '20190211;14:32', instance_double('phone'), Phone.new('55 011 5555 6666'))
    expect(international_call.cost).to eq 12
  end
  it 'international call call to rest of world of 1 minute' do
    international_call = InternationalCall.new('20190211;14:30', '20190211;14:31', instance_double('phone'), Phone.new('39 011 5555 6666'))
    expect(international_call.cost).to eq 15
  end
  it 'international call call to rest of world of 2 minutes' do
    international_call = InternationalCall.new('20190211;14:30', '20190211;14:32', instance_double('phone'), Phone.new('39 011 5555 6666'))
    expect(international_call.cost).to eq 30
  end
end
