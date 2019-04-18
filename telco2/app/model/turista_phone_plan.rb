class TuristaPhonePlan
  def initialize(country_code)
    @country_code = country_code
    @base_cost = 300
    @name = 'turista'
  end
  attr_reader :base_cost
  attr_reader :name
  def cost(_call)
    3.2
  end
end
