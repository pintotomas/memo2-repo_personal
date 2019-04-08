require 'rspec'
require 'rspec/mocks'
require_relative '../app/model/call/call'

describe 'Call' do
  it 'Call with invalid start time format should raise exception' do
    params = { 'start' => '', 'end' => '', 'origin' => instance_double('phone') }
    expect { Call.new(params) }.to raise_error(InvalidCallStartOrEndTimeError)
  end
  it 'Call with start time after end time should raise exception' do
    params = { 'start' => '20190211;14:30', 'end' => '20190211;14:29', 'origin' => instance_double('phone') }
    expect { Call.new(params) }.to raise_error CallEndTimeBeforeStartTimeError
  end
  it 'Call month' do
    params = { 'start' => '20190110', 'end' => '20190111', 'origin' => instance_double('phone') }
    expect(Call.new(params).month).to eq 1
  end
  it 'Call year' do
    params = { 'start' => '20190110', 'end' => '20190111', 'origin' => instance_double('phone') }
    expect(Call.new(params).year).to eq 2019
  end
end
