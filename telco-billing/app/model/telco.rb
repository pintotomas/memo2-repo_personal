require 'time'
class Telco
  def call_cost(inicio, _fin)
    # Returns call cost
    start_hour = Time.parse(inicio).hour
    return 3.2 if start_hour < 20

    1.8
  end
end
