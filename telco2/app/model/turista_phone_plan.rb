class TuristaPhonePlan
  def initialize(country_code)
    @country_code = country_code
    @base_cost = 300
    @name = 'turista'
  end
  attr_reader :base_cost
  attr_reader :name
  def cost(call)
    return call.cost unless call.phone_number_destiny.country_code == @country_code

    20
  end
end
