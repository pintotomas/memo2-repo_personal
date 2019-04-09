require_relative 'call'
require_relative '../time_aux'
require_relative '../minutes/minute_counter'
class NationalCall < Call
  def initialize(origin, destiny, start_time_stamp, end_time_stamp)
    # call_start_time and call_end_time must have yyyymmdd;hhmm
    super(origin, destiny, start_time_stamp, end_time_stamp)
    cost = 1.5

    @min_counter = MinuteCounter.new(cost)
    @minute_counters = [@min_counter]
    process_call
  end

  def cost
    base_cost = 20
    free_minutes = 5
    @min_counter.cost(free_minutes) + base_cost
  end

  private

  def process_call
    midnight = 0
    night = 23
    params = { 0 => { 'since' => midnight, 'until' => night }, 1 => { 'since' => midnight, 'until' => night },
               2 => { 'since' => midnight, 'until' => night }, 3 => { 'since' => midnight, 'until' => night },
               4 => { 'since' => midnight, 'until' => night }, 5 => { 'since' => midnight, 'until' => night },
               6 => { 'since' => midnight, 'until' => night } }
    TimeAux.count_minutes(@call_start_time, @call_end_time, params, @min_counter)
  end
end
