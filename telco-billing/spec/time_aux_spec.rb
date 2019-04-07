require 'rspec'
require 'time'
require_relative '../app/model/time_aux.rb'
require_relative '../app/model/minutes/minute_counter.rb'

describe 'TimeAux' do
  it 'time_aux counts correctly one minutes' do
    minute_counter = MinuteCounter.new(2.5)
    params = { 1 => { 'since' => 14, 'until' => 15 } }
    TimeAux.count_minutes(Time.parse('20190211;14:30'), Time.parse('20190211;14:31'), params, minute_counter)
    expect(minute_counter.cost).to eq 2.5
  end

  it 'time_aux doesnt count minutes if the start time and end time are equal' do
    minute_counter = MinuteCounter.new(2.5)
    params = { 1 => { 'since' => 14, 'until' => 15 } }
    TimeAux.count_minutes(Time.parse('20190211;14:30'), Time.parse('20190211;14:30'), params, minute_counter)
    expect(minute_counter.cost).to eq 0
  end
  it 'time_aux doesnt doesnt count minutes if they ocurr during a day that should not be considered' do
    minute_counter = MinuteCounter.new(2.5)
    params = { 2 => { 'since' => 14, 'until' => 15 } }
    TimeAux.count_minutes(Time.parse('20190211;14:30'), Time.parse('20190211;14:32'), params, minute_counter)
    expect(minute_counter.cost).to eq 0
  end
  it 'time_aux doesnt count minutes if they are out of the time range of that day' do
    minute_counter = MinuteCounter.new(2.5)
    params = { 0 => { 'since' => 18, 'until' => 20 } }
    TimeAux.count_minutes(Time.parse('20190224;14:35'), Time.parse('20190224;14:40'), params, minute_counter)
    expect(minute_counter.cost).to eq 0
  end
end
