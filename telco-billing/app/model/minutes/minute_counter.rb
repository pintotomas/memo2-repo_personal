require_relative '../../aux/functions'
class MinuteCounter
  def initialize(cost)
    @quantity = 0
    @cost = cost
  end

  def inc
    @quantity += 1
  end

  def cost(free_minutes = 0)
    final_quantity = max(@quantity - free_minutes, 0)
    final_quantity * @cost
  end
end
