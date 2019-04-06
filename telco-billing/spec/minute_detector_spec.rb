require 'rspec'
require 'time'
require_relative '../app/model/minute_detector.rb'
require 'byebug'
describe 'MinuteDetector' do
  let(:minute_detector) { MinuteDetector.new }

  it 'detector detects correctly the quantity of minutes of a Call of 1 minu on weekend ' do
    start = Time.parse('20190209;14:30')
    finish = Time.parse('20190209;14:31')
    minute_count = MinuteDetector.differentiate_call_minutes(start, finish)
    weekend_minutes = minute_count['weekend_minutes']
    expect(weekend_minutes).to eq 1
  end

  it 'detector detects correctly the quantity of minutes of Call of 1 min (daylight) on weekday ' do
    start = Time.parse('20190212;14:30')
    finish = Time.parse('20190212;14:31')
    minute_count = MinuteDetector.differentiate_call_minutes(start, finish)
    week_day_minutes = minute_count['week_day_minutes']
    expect(week_day_minutes).to eq 1
  end

  it 'detector detects correctly the quantity of minutes of Call of 1 min (night) on weekday ' do
    start = Time.parse('20190212;20:30')
    finish = Time.parse('20190212;20:31')
    minute_count = MinuteDetector.differentiate_call_minutes(start, finish)
    week_night_minutes = minute_count['week_night_minutes']
    expect(week_night_minutes).to eq 1
  end
  it 'detector detects correctly the quantity of minutes of a Call of 2 minu on weekend ' do
    start = Time.parse('20190209;14:30')
    finish = Time.parse('20190209;14:32')
    minute_count = MinuteDetector.differentiate_call_minutes(start, finish)
    weekend_minutes = minute_count['weekend_minutes']
    expect(weekend_minutes).to eq 2
  end

  it 'detector detects correctly the quantity of minutes of Call of 2 min (daylight) on weekday ' do
    start = Time.parse('20190212;14:30')
    finish = Time.parse('20190212;14:32')
    minute_count = MinuteDetector.differentiate_call_minutes(start, finish)
    week_day_minutes = minute_count['week_day_minutes']
    expect(week_day_minutes).to eq 2
  end

  it 'detector detects correctly the quantity of minutes of Call of 2 min (night) on weekday ' do
    start = Time.parse('20190212;20:30')
    finish = Time.parse('20190212;20:32')
    minute_count = MinuteDetector.differentiate_call_minutes(start, finish)
    week_night_minutes = minute_count['week_night_minutes']
    expect(week_night_minutes).to eq 2
  end
    it 'detector detects correctly the quantity of minutes of Call of 2 min between a friday night and a saturday ' do
    #byebug
    start = Time.parse('20190208;23:59')
    finish = Time.parse('20190209;00:01')
    minute_count = MinuteDetector.differentiate_call_minutes(start, finish)
    week_night_minutes = minute_count['week_night_minutes']
    weekend_minutes = minute_count['weekend_minutes']
    expect(week_night_minutes).to eq 1
    expect(weekend_minutes).to eq 1
  end
end
