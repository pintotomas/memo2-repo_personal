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

  it 'Call on a sunday, when asked if it was made on sunday, should return true' do
    expect(Call.new('20190210;14:30', '20190210;14:31').sunday).to eq true
  end
  it 'Call on a saturday, when asked if it was made on saturday, should return true' do
    expect(Call.new('20190209;14:30', '20190209;14:31').saturday).to eq true
  end
  it 'Call on a monday, when asked if it was made on saturday, should return false' do
    expect(Call.new('20190211;14:30', '20190214;14:31').saturday).to eq false
  end
  it 'Call on a monday, when asked if it was made on sunday, should return false' do
    expect(Call.new('20190211;14:30', '20190214;14:31').sunday).to eq false
  end
  it 'Call on a friday, when asked if it was made on saturday, should return false' do
    expect(Call.new('20190215;14:30', '20190215;14:31').saturday).to eq false
  end
  it 'Call on a friday, when asked if it was made on sunday, should return false' do
    expect(Call.new('20190215;14:30', '20190215;14:31').sunday).to eq false
  end
end
