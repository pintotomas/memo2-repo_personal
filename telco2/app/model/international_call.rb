require_relative '../aux/functions'
require_relative 'time_constants'
require 'time'

class InternationalCall
  DAY_DURATION = 24
  HOUR_DURATION = 60
  WEEKENDS_DISCOUNT = 0.5
  MIN_COST_PER_COUNTRY_CODE = { '52' => 10, '55' => 6, '39' => 15 }.freeze

  attr_reader :start_date_time
  attr_reader :phone_number_destiny
  attr_reader :total_duration

  def initialize(phone_number_destiny, start_date_time, end_date_time)
    @phone_number_destiny = phone_number_destiny
    @country_code = phone_number_destiny.country_code
    @start_date_time = start_date_time
    @end_date_time = end_date_time
    weekend_call_duration
    week_call_duration
  end

  def cost
    week_cost = @week_call_duration * MIN_COST_PER_COUNTRY_CODE[@country_code]
    weekends_cost = @weekend_minutes_call_duration * MIN_COST_PER_COUNTRY_CODE[@country_code] *
                    WEEKENDS_DISCOUNT
    week_cost + weekends_cost
  end

  private

  def weekend_call_duration
    weekends_info = { $SATURDAY => { 'since' => $MIDNIGHT, 'until' => $NIGHT },
                      $SUNDAY => { 'since' => $MIDNIGHT, 'until' => $NIGHT } }
    start = to_time(@start_date_time)
    finish = to_time(@end_date_time)
    @weekend_minutes_call_duration = count_seconds(start, finish, weekends_info) /
                                     $ONE_MINUTE_IN_SECONDS
  end

  def week_call_duration
    start = to_time(@start_date_time)
    finish = to_time(@end_date_time)
    @total_duration = (finish - start) / $ONE_MINUTE_IN_SECONDS
    @week_call_duration = @total_duration - @weekend_minutes_call_duration
  end
end
