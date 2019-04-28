class HourHandler
  CENTRAL_HOUR_END = 20
  CENTRAL_HOUR_START = 8
  WEEKEND = %w[SATURDAY SUNDAY].freeze

  def create_hour(start_date, end_date)
    hour = start_date.strftime('%H').to_i
    day_of_week = start_date.strftime('%^A')
    if WEEKEND.include?(day_of_week)
      WeekendHourCost.new(start_date, end_date)
    elsif hour < CENTRAL_HOUR_END && hour >= CENTRAL_HOUR_START
      CentralHourCost.new(start_date, end_date)
    else
      RegularHourCost.new(start_date, end_date)
    end
  end
end
