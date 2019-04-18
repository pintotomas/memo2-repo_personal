require_relative 'phone_number'
require_relative 'friends_phone_plan'
require_relative 'basic_phone_plan'
require_relative 'turista_phone_plan'
class PhonesOrganizer
  def initialize
    @phones = {}
    @plans = {} # (number => Plan)
  end

  def find_or_create_phone(number)
    return @phones[number] if @phones.include?(number)

    @phones[number] = PhoneNumber.new(number)
  end

  def reset
    @phones.clear
    @plans.clear
  end

  def register_plan(number, plan_name, plan_parameters)
    plans = { 'amigos' => FriendsPhonePlan, 'turista' => TuristaPhonePlan }
    @plans[number] = plans[plan_name].new(plan_parameters)
  end

  def plan(phone_number)
    return BasicPhonePlan.new unless @plans.key? phone_number

    @plans[phone_number]
  end
end
