require 'rspec'
require_relative '../app/model/telco'
require_relative '../app/model/call/local_call'
require 'rspec/mocks'

describe 'LocalCall' do
  it 'Local call with one minute duration between 8 and 20 hs on weekdays should cost 3.2' do
    call = LocalCall.new(instance_double('phone'), instance_double('phone'), '20190211;14:30', '20190211;14:31')
    expect(call.cost).to eq 3.2
  end

  it 'Local call with one minute duration between 20 and 8 hs on weekdays should cost 1.8' do
    expect(LocalCall.new(instance_double('phone'), instance_double('phone'), '20190211;22:30', '20190211;22:31').cost).to eq 1.8
  end
  it 'Local call with one minute duration on weekend should cost 2.1' do
    expect(LocalCall.new(instance_double('phone'), instance_double('phone'), '20190210;14:30', '20190210;14:31').cost).to eq 2.1
  end
  it 'Local call with two minutes duration between 8 and 20 hs on weekdays should cost 6.4' do
    expect(LocalCall.new(instance_double('phone'), instance_double('phone'), '20190211;14:30', '20190211;14:32').cost).to eq 6.4
  end
  it 'Local call with two minutes duration between 20 and 8 hs on weekdays should cost 3.6' do
    expect(LocalCall.new(instance_double('phone'), instance_double('phone'), '20190211;22:30', '20190211;22:32').cost).to eq 3.6
  end
  it 'Local call with two minutes duration during cost change during week (day to night)' do
    expect(LocalCall.new(instance_double('phone'), instance_double('phone'), '20190211;19:59', '20190211;20:01').cost).to eq 3.2 + 1.8
  end
  it 'Local call with two minutes duration during cost change during week (night to day)' do
    expect(LocalCall.new(instance_double('phone'), instance_double('phone'), '20190211;07:59', '20190211;08:01').cost).to eq 3.2 + 1.8
  end
  it 'Local call with two minutes duration during cost change during week (night to midnight)' do
    expect(LocalCall.new(instance_double('phone'), instance_double('phone'), '20190211;23:59', '20190212;00:01').cost).to eq 1.8 + 1.8
  end
  it 'Local call with two minutes duration during cost change from week to weekend' do
    expect(LocalCall.new(instance_double('phone'), instance_double('phone'), '20190215;23:59', '20190216;00:01').cost).to eq 1.8 + 2.1
  end
  it 'Local call with two minutes duration during cost change from weekend to week' do
    expect(LocalCall.new(instance_double('phone'), instance_double('phone'), '20190217;23:59', '20190218;00:01').cost).to eq 2.1 + 1.8
  end
end
