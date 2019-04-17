require_relative '../aux/functions'
require 'time'
class InternationalCall
  DAY_DURATION = 24
  HOUR_DURATION = 60
  WEEKENDS_DISCOUNT = 0.5
  MIN_COST_PER_COUNTRY_CODE = { '52' => 10, '55' => 6, '39' => 15 }.freeze

  attr_reader :start_date_time

  def initialize(phone_number_destiny, start_date_time, end_date_time)
    @phone_number_destiny = phone_number_destiny
    @country_code = phone_number_destiny.country_code
    @start_date_time = start_date_time
    @end_date_time = end_date_time
    weekends_info = { 0 => { 'since' => 0, 'until' => 23 }, 6 => { 'since' => 0, 'until' => 23 } }
    @weekend_minutes_call_duration = count_seconds(@start_date_time.to_time,
                                                   @end_date_time.to_time, weekends_info) / 60
    total_duration = (end_date_time.to_time - start_date_time.to_time) / 60
    @week_call_duration = total_duration - @weekend_minutes_call_duration
  end

  def cost
    week_cost = @week_call_duration * MIN_COST_PER_COUNTRY_CODE[@country_code]
    weekends_cost = @weekend_minutes_call_duration * MIN_COST_PER_COUNTRY_CODE[@country_code] *
                    WEEKENDS_DISCOUNT
    week_cost + weekends_cost
  end
end
