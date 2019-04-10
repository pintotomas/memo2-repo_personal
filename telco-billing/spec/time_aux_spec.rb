require 'rspec'
require 'time'
require_relative '../app/aux/functions'

describe 'TimeAux' do
  it 'count_seconds counts correctly one minutes' do
    params = { 1 => { 'since' => 14, 'until' => 15 } }
    seconds = count_seconds(Time.parse('20190211;14:30'), Time.parse('20190211;14:31'), params)
    expect(seconds).to eq 60
  end

  it 'count_seconds doesnt count minutes if the start time and end time are equal' do
    params = { 1 => { 'since' => 14, 'until' => 15 } }
    seconds = count_seconds(Time.parse('20190211;14:30'), Time.parse('20190211;14:30'), params)
    expect(seconds).to eq 0
  end
  it 'count_seconds doesnt doesnt count minutes if they ocurr during a day that should not be considered' do
    params = { 2 => { 'since' => 14, 'until' => 15 } }
    seconds = count_seconds(Time.parse('20190211;14:30'), Time.parse('20190211;14:32'), params)
    expect(seconds).to eq 0
  end
  it 'count_seconds doesnt count minutes if they are out of the time range of that day' do
    params = { 0 => { 'since' => 18, 'until' => 20 } }
    seconds = count_seconds(Time.parse('20190224;14:35'), Time.parse('20190224;14:40'), params)
    expect(seconds).to eq 0
  end
  it 'count_seconds doesnt count minutes if they are out of the time range of that day, but counts the minutes inside' do
    params = { 0 => { 'since' => 14, 'until' => 15 } }
    seconds = count_seconds(Time.parse('20190224;15:58'), Time.parse('20190224;16:40'), params)
    expect(seconds).to eq 120
  end
end
