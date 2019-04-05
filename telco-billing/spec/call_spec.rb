require 'rspec'
require_relative '../app/model/call'

describe 'Call' do
  it 'Call with invalid start time format should raise exception' do
    expect { Call.new('', '') }.to raise_error(InvalidCallStartOrEndTimeError)
  end
  it 'Call with start time after end time should raise exception' do
    expect do
      Call.new('20190211;14:31',
               '20190211;14:30')
    end .to raise_error CallEndTimeBeforeStartTimeError
  end

  it 'Call with one minute duration' do
    expect(Call.new('20190211;14:30', '20190211;14:31').duration).to eq 60
  end

  it 'Call with three minutes duration' do
    expect(Call.new('20190211;14:30', '20190211;14:33').duration).to eq 180
  end
end
