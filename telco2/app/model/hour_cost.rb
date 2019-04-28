require 'time'

class HourCost
  DAY_DURATION = 24
  HOUR_DURATION = 60
  MINUTE_DURATION = 60

  def initialize(start_date_time, end_date_time)
    @start_date_time = start_date_time
    @end_date_time = end_date_time
    @call_duration = ((end_date_time - start_date_time) * DAY_DURATION * HOUR_DURATION).to_i
    @minutes = minutes_until_next_hour
    @hour_handler = HourHandler.new
  end

  def cost
    if @minutes < HOUR_DURATION
      next_hour = add_minutes
      @minutes * cost_per_minute + next_hour.cost
    elsif @call_duration > HOUR_DURATION
      next_hour = add_hour
      HOUR_DURATION * cost_per_minute + next_hour.cost
    else
      @call_duration * cost_per_minute
    end
  end

  private

  def minutes_until_next_hour
    HOUR_DURATION - @start_date_time.strftime('%M').to_i
  end

  def add_hour
    time = Time.parse(@start_date_time.to_s)
    new_time = time + 1 * MINUTE_DURATION * HOUR_DURATION
    new_date = DateTime.parse(new_time.to_s)
    @hour_handler.create_hour(new_date, @end_date_time)
  end

  def add_minutes
    time = Time.parse(@start_date_time.to_s)
    new_time = time + 1 * MINUTE_DURATION * @minutes
    new_date = DateTime.parse(new_time.to_s)
    @hour_handler.create_hour(new_date, @end_date_time)
  end

  def cost_per_minute
    raise 'Should be implemented by subclass'
  end
end
