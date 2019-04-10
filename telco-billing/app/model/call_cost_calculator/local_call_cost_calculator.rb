require_relative '../../aux/functions'
require 'byebug'
require_relative 'call_cost_constants'

class LocalCallCostCalculator
  def initialize
    @weekends_cost = 2.1
    @weekday_night_cost = 1.8
    @weekday_day_cost = 3.2
  end

  def cost(call)
    weekends = { $sunday => { 'since' => $midnight, 'until' => $night }, $saturday => { 'since' => $midnight, 'until' => $night } }

    week_days = { $monday => { 'since' => $morning, 'until' => $afternoon }, $tuesday => { 'since' => $morning,
                                                                                           'until' => $afternoon },
                  $wednesday => { 'since' => $morning, 'until' => $afternoon }, $thursday => { 'since' => $morning,
                                                                                               'until' => $afternoon },
                  $friday => { 'since' => $morning, 'until' => $afternoon } }

    start = call.call_start_time
    finish = call.call_end_time
    call_duration = finish - start
    call_seconds_during_weekends = count_seconds(start, finish, weekends)
    call_seconds_during_week_days = count_seconds(start, finish, week_days)
    # following var is always >= 0
    call_seconds_during_week_nights = call_duration - call_seconds_during_weekends - call_seconds_during_week_days
    week_night_mins = call_seconds_during_week_nights / $one_minute_in_seconds
    week_day_mins = call_seconds_during_week_days / $one_minute_in_seconds
    weekends_mins = call_seconds_during_weekends / $one_minute_in_seconds
    @weekends_cost * weekends_mins + @weekday_night_cost * week_night_mins + @weekday_day_cost * week_day_mins
  end
end
