require_relative 'call'
require_relative '../time_aux'
require_relative '../minutes/minute_counter'
class InternationalCall < Call
  # After integrating phone, removing country_code

  def initialize(call_start_time, call_end_time, phone)
    # call_start_time and call_end_time must have yyyymmdd;hhmm
    super(call_start_time, call_end_time, phone)
    costs = { '52' => 10, '55' => 6, '39' => 15 }
    cost = costs[phone.country_code]

    @min_counter = MinuteCounter.new(cost)
    @minute_counters = [@min_counter]

    process_call
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
