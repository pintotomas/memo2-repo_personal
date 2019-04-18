class TuristaPhonePlan
  def initialize(country_code)
    @country_code = country_code
    @base_cost = 300
  end
  attr_reader :base_cost
end
