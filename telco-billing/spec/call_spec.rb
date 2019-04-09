require 'rspec'
require 'rspec/mocks'
require_relative '../app/model/call/call'

describe 'Call' do
  it 'Call with invalid start time format should raise exception' do
    expect { Call.new(instance_double('phone'), instance_double('phone'), '', '') }.to raise_error(InvalidCallStartOrEndTimeError)
  end
  it 'Call with start time after end time should raise exception' do
    expect do
      Call.new(instance_double('phone'), instance_double('phone'),
               '20190211;14:30', '20190211;14:29')
    end .to raise_error CallEndTimeBeforeStartTimeError
  end
  it 'Call month' do
    expect(Call.new(instance_double('phone'), instance_double('phone'), '20190110', '20190111').month).to eq 1
  end
  it 'Call year' do
    expect(Call.new(instance_double('phone'), instance_double('phone'), '20190110', '20190111').year).to eq 2019
  end
end
