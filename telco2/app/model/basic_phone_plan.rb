class BasicPhonePlan
  def initialize
    @name = 'ninguno'
    @base_cost = 100
  end
  attr_reader :name
  attr_reader :base_cost
  def cost(call)
    call.cost
  end
end
