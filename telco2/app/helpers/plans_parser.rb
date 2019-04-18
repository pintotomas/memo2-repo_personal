require_relative 'plans_validator'
class PlansParser
  def initialize(input)
    validator = PlansValidator.new
    validator.validate_input(input)
    @input = input
  end

  def register_new_plan(client_organizer)
    plan = @input['plan']
    new_amigos_plan(client_organizer) if plan == 'amigos'
    new_turista_plan(client_organizer) if plan == 'turista'
  end

  def actual_plan(client_organizer)
    client_organizer.plan(@input['numero'].delete(' ')).name
  end

  private

  def new_turista_plan(_client_organizer)
    raise 'to be implemented'
  end

  def new_amigos_plan(client_organizer)
    friends = @input['amigos'].split(',')
    owner_number = @input['numero'].delete(' ')
    client_organizer.register_plan(owner_number, 'amigos', friends)
  end
end
