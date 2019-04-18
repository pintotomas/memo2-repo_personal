require_relative 'phone_number'
require_relative 'friends_phone_plan'
require_relative 'errors/only_one_plan_per_phone'
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
  end

  def register_plan(number, plan_name)
    raise OnlyOnePlanPerPhone if @plans.key? number

    plans = { 'amigos' => FriendsPhonePlan }
    @plans[number] = plans[plan_name].new
  end
end
