class MinuteCounter
  def initialize(cost)
    @quantity = 0
    @cost = cost
  end

  def inc
    @quantity += 1
  end

  def cost
    @quantity * @cost
  end
end
