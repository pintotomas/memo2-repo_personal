require 'time'
require_relative 'call/call_factory'
require_relative 'call/call_registry'

class Telco
  def initialize
    @call_factory = CallFactory.new
    @call_registry = CallRegistry.new
  end

  def call_cost(call_info)
    # Returns call cost
    call = @call_factory.new_call(call_info)
    @call_registry.push(call)
    call.cost
  end

  def bill(billing_info)
    phone = billing_info['number']
    year = billing_info['year_month'][0..3].to_i
    month = billing_info['year_month'][4..5].to_i

    corresponding_calls = @call_registry.select { |call| call.phone == phone && call.month == month && call.year == year }
    # result = @call_registry.select do |call|
    #   (call.year == year) &&
    #     (call.month == month) &&
    #     (call.phone == phone)
    # end
    total_cost = 0
    corresponding_calls.each do |call|
      total_cost += call.cost
    end
    calls_made = corresponding_calls.length
    [calls_made, total_cost]
  end
end
