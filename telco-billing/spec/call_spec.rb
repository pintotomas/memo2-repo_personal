require 'rspec'
require 'rspec/mocks'
require_relative '../app/model/call/call'

describe 'Call' do
  it 'Call with invalid start time format should raise exception' do
    expect { Call.new('', '', instance_double('phone'), instance_double('phone')) }.to raise_error(InvalidCallStartOrEndTimeError)
  end
  it 'Call with start time after end time should raise exception' do
    expect do
      Call.new('20190211;14:31',
               '20190211;14:30',
               instance_double('phone'), instance_double('phone'))
    end .to raise_error CallEndTimeBeforeStartTimeError
  end
end
