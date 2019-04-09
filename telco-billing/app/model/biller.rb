require_relative 'call/call_registry'

class Biller
  def initialize(base_cost)
    @base_cost = base_cost
  end

  def make_bill(call_registry)
    total_cost = 0
    call_registry.each do |call|
      total_cost += call.cost
    end
    calls_made = call_registry.length
    [calls_made, total_cost + @base_cost]
  end
end
