require 'time'
require_relative 'call_exceptions'
require_relative '../minutes/minute_counter.rb'
require_relative '../time_aux'

class Call
  def initialize(call_start_time, call_end_time)
    # call_start_time and call_end_time must have yyyymmdd;hhmm

    weekends_cost = 2.1
    weekday_night_cost = 1.8
    weekday_dawn_cost = 1.8
    weekday_day_cost = 3.2

    @weekend_min_counter = MinuteCounter.new(weekends_cost)
    @week_day_min_counter = MinuteCounter.new(weekday_day_cost)
    @week_night_min_counter = MinuteCounter.new(weekday_night_cost)
    @week_dawn_min_counter = MinuteCounter.new(weekday_dawn_cost)
    @minute_counters = [@weekend_min_counter, @week_day_min_counter, @week_night_min_counter, @week_dawn_min_counter]

    process_call(Time.parse(call_start_time), Time.parse(call_end_time))
  rescue ArgumentError
    raise InvalidCallStartOrEndTimeError
  end

  def cost
    total_cost = 0
    @minute_counters.each do |counter|
      total_cost += counter.cost
    end
    total_cost
  end

  private

  def process_call(time_start, time_end)
    raise CallEndTimeBeforeStartTimeError unless time_start < time_end

    evening = 20
    afternoon = 19
    dawning = 7
    morning = 8
    midnight = 0
    night = 23

    weekend_hours = { 0 => { 'since' => midnight, 'until' => night }, 6 => { 'since' => midnight,
                                                                             'until' => night } }
    TimeAux.count_minutes(time_start, time_end, weekend_hours, @weekend_min_counter)

    week_days_hours = { 1 => { 'since' => morning, 'until' => afternoon }, 2 => { 'since' => morning,
                                                                                  'until' => afternoon },
                        3 => { 'since' => morning, 'until' => afternoon }, 4 => { 'since' => morning,
                                                                                  'until' => afternoon },
                        5 => { 'since' => morning, 'until' => afternoon } }
    TimeAux.count_minutes(time_start, time_end, week_days_hours, @week_day_min_counter)

    week_nights_hours = { 1 => { 'since' => evening, 'until' => night }, 2 => { 'since' => evening,
                                                                                'until' => night },
                          3 => { 'since' => evening, 'until' => night }, 4 => { 'since' => evening,
                                                                                'until' => night },
                          5 => { 'since' => evening, 'until' => night } }

    TimeAux.count_minutes(time_start, time_end, week_nights_hours, @week_night_min_counter)

    week_dawn_hours = { 1 => { 'since' => midnight, 'until' => dawning }, 2 => { 'since' => midnight,
                                                                                 'until' => dawning },
                        3 => { 'since' => midnight, 'until' => dawning }, 4 => { 'since' => midnight,
                                                                                 'until' => dawning },
                        5 => { 'since' => midnight, 'until' => dawning } }

    TimeAux.count_minutes(time_start, time_end, week_dawn_hours, @week_dawn_min_counter)
  end
end
