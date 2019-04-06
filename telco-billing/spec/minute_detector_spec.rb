require 'rspec'
require 'time'
require_relative '../app/model/minute_detector.rb'
require 'byebug'
describe 'MinuteDetector' do
  let(:minute_detector) { MinuteDetector.new }

  it 'detects correctly the quantity of minutes of a Call of 1 minu on weekend ' do
    start = Time.parse('20190209;14:30')
    finish = Time.parse('20190209;14:31')
    minute_count = MinuteDetector.differentiate_call_minutes(start, finish)
    weekend_min = minute_count['weekend_min']
    expect(weekend_min).to eq 1
  end

  it 'detects correctly the quantity of minutes of Call of 1 min (daylight) on weekday ' do
    start = Time.parse('20190212;14:30')
    finish = Time.parse('20190212;14:31')
    minute_count = MinuteDetector.differentiate_call_minutes(start, finish)
    week_day_min = minute_count['week_day_min']
    expect(week_day_min).to eq 1
  end

  it 'detects correctly the quantity of minutes of Call of 1 min (night) on weekday ' do
    start = Time.parse('20190212;20:30')
    finish = Time.parse('20190212;20:31')
    minute_count = MinuteDetector.differentiate_call_minutes(start, finish)
    week_night_min = minute_count['week_night_min']
    expect(week_night_min).to eq 1
  end
  it 'detects correctly the quantity of minutes of a Call of 2 minu on weekend ' do
    start = Time.parse('20190209;14:30')
    finish = Time.parse('20190209;14:32')
    minute_count = MinuteDetector.differentiate_call_minutes(start, finish)
    weekend_min = minute_count['weekend_min']
    expect(weekend_min).to eq 2
  end

  it 'detects correctly the quantity of minutes of Call of 2 min (daylight) on weekday ' do
    start = Time.parse('20190212;14:30')
    finish = Time.parse('20190212;14:32')
    minute_count = MinuteDetector.differentiate_call_minutes(start, finish)
    week_day_min = minute_count['week_day_min']
    expect(week_day_min).to eq 2
  end

  it 'detects correctly the quantity of minutes of Call of 2 min (night) on weekday' do
    start = Time.parse('20190212;20:30')
    finish = Time.parse('20190212;20:32')
    minute_count = MinuteDetector.differentiate_call_minutes(start, finish)
    week_night_min = minute_count['week_night_min']
    expect(week_night_min).to eq 2
  end
  it 'detects correctly quantity of minutes of 2 min call between friday and a saturday ' do
    start = Time.parse('20190208;23:59')
    finish = Time.parse('20190209;00:01')
    minute_count = MinuteDetector.differentiate_call_minutes(start, finish)
    expect(minute_count['week_night_min']).to eq 1
    expect(minute_count['weekend_min']).to eq 1
  end
  it 'detects correctly quantity of minutes of 2 min call start on week day finish week night ' do
    start = Time.parse('20190212;19:59')
    finish = Time.parse('20190212;20:01')
    minute_count = MinuteDetector.differentiate_call_minutes(start, finish)
    expect(minute_count['week_night_min']).to eq 1
    expect(minute_count['week_day_min']).to eq 1
  end
  it 'detects correctly quantity of minutes of 2 min call start on sunday finish monday ' do
    start = Time.parse('20190210;23:59')
    finish = Time.parse('20190211;00:01')
    minute_count = MinuteDetector.differentiate_call_minutes(start, finish)
    expect(minute_count['weekend_min']).to eq 1
    expect(minute_count['week_night_min']).to eq 1
  end
end
