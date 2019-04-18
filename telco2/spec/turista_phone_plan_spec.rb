require_relative '../app/model/turista_phone_plan'

describe 'TuristaPhonePlan' do
  plan = TuristaPhonePlan.new('55')
  it 'base cost of the plan equals 300' do
    expect(plan.base_cost).to eq 300
  end
  it 'name of the plan equals turista' do
    expect(plan.name).to eq 'turista'
  end
end
