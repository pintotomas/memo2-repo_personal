require_relative '../app/model/basic_phone_plan'
require_relative '../app/model/phone_number'
require_relative '../app/model/local_call'

describe 'BasicPhonePlan' do
  basic_phone_plan = BasicPhonePlan.new
  it 'name of the plan' do
    expect(basic_phone_plan.name).to eq 'ninguno'
  end
end
