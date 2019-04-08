require 'rspec'
require_relative '../app/model/telco'
require_relative '../app/model/call/local_call'
require 'rspec/mocks'

describe 'LocalCall' do
  it 'Local call with one minute duration between 8 and 20 hs on weekdays should cost 3.2' do
    expect(LocalCall.new('20190211;14:30', '20190211;14:31', instance_double('phone')).cost).to eq 3.2
  end

  it 'Local call with one minute duration between 20 and 8 hs on weekdays should cost 1.8' do
    expect(LocalCall.new('20190211;22:30', '20190211;22:31', instance_double('phone')).cost).to eq 1.8
  end
  it 'Local call with one minute duration on weekend should cost 2.1' do
    expect(LocalCall.new('20190210;14:30', '20190210;14:31', instance_double('phone')).cost).to eq 2.1
  end
  it 'Local call with two minutes duration between 8 and 20 hs on weekdays should cost 6.4' do
    expect(LocalCall.new('20190211;14:30', '20190211;14:32', instance_double('phone')).cost).to eq 6.4
  end
  it 'Local call with two minutes duration between 20 and 8 hs on weekdays should cost 3.6' do
    expect(LocalCall.new('20190211;22:30', '20190211;22:32', instance_double('phone')).cost).to eq 3.6
  end
end
