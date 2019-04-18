require_relative 'plans_validator'
class PlansParser
  def register_new_plan(client_organizer, input)
    validator = PlansValidator.new
    validator.validate_input(input)
    plan = input['plan']
    new_amigos_plan(client_organizer, input) if plan == 'amigos'
    new_turista_plan(client_organizer, input) if plan == 'turista'
  end

  private

  def new_turista_plan(client_organizer, input); end

  def new_amigos_plan(client_organizer, input)
    friends = input['amigos'].split(',')
    owner_number = input['numero'].delete(' ')
    client_organizer.register_plan(owner_number, 'amigos', friends)
  end
end
