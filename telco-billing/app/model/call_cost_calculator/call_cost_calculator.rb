require_relative '../exceptions/general_exceptions'
class CallCostCalculator
  def initialize
    raise SubclassResponsibility
  end

  def cost(_call)
    raise SubclassResponsibility
  end
end
