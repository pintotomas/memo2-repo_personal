require 'rspec'
require 'time'
require 'byebug'
require_relative '../app/model/minute_detector.rb'
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
end
