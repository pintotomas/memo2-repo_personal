require_relative 'phone_number'
require_relative 'friends_phone_plan'
require_relative 'basic_phone_plan'
require_relative 'errors/only_one_plan_per_phone'
class PhonesOrganizer
  def initialize
    @phones = {}
    @plans = {} # (number => Plan)
  end

  def find_or_create_phone(number)
    return @phones[number] if @phones.include?(number)

    @plans[number] = BasicPhonePlan.new
    @phones[number] = PhoneNumber.new(number)
  end

  def reset
    @phones.clear
    @plans.clear
  end

  def register_plan(number, plan_name, plan_parameters)
    raise OnlyOnePlanPerPhone if @plans.key? number

    plans = { 'amigos' => FriendsPhonePlan }
    @plans[number] = plans[plan_name].new(plan_parameters)
  end

  def actual_plan_name(phone_number)
    return 'ninguno' unless @plans.key? phone_number

    @plans[phone_number].name
  end

  def plan(phone_number)
    @plans[phone_number]
  end
end
