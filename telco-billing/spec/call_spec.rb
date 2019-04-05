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

  it 'Call started on saturday,asked if it started weekend, should return true' do
    expect(Call.new('20190209;14:30', '20190209;14:31').started_weekend).to eq true
  end
  it 'Call started monday, asked if it started weekend, should return false' do
    expect(Call.new('20190211;14:30', '20190211;14:31').started_weekend).to eq false
  end
  it 'Call started friday, when asked if it started weekend, should return false' do
    expect(Call.new('20190215;14:30', '20190215;14:31').started_weekend).to eq false
  end
  it 'Call ended on saturday,asked if it ended weekend, should return true' do
    expect(Call.new('20190209;14:30', '20190209;14:31').ended_weekend).to eq true
  end
  it 'Call ended monday, asked if it ended weekend, should return false' do
    expect(Call.new('20190211;14:30', '20190211;14:31').ended_weekend).to eq false
  end
  it 'Call ended friday, when asked if it ended weekend, should return false' do
    expect(Call.new('20190215;14:30', '20190215;14:31').ended_weekend).to eq false
  end
  it 'Call made 8pm should have started before 9pm' do
    expect(Call.new('20190215;20:30', '20190215;21:31').started_before(21)).to eq true
  end
  it 'Call made 8pm shouldnt have started before 7pm' do
    expect(Call.new('20190215;20:30', '20190215;21:31').started_before(19)).to eq false
  end
end
