class Biller
  def initialize(base_cost)
    @base_cost = base_cost
  end

  def make_bill(call_registry, calculator)
    total_cost = 0
    call_registry.each do |call|
      total_cost += calculator.cost(call)
    end
    calls_made = call_registry.length
    [calls_made, total_cost + @base_cost]
  end
end
