require_relative '../app/model/basic_phone_plan'
require_relative '../app/model/phone_number'
require_relative '../app/model/local_call'

describe 'BasicPhonePlan' do
  basic_phone_plan = BasicPhonePlan.new
  it 'name of the plan should be ninguno' do
    expect(basic_phone_plan.name).to eq 'ninguno'
  end
  it 'cost of the plan should be 100' do
    expect(basic_phone_plan.base_cost).to eq 100
  end
end
