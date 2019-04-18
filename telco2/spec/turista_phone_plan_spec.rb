require_relative '../app/model/turista_phone_plan'
require_relative '../app/model/phone_number'
require_relative '../app/model/local_call'
require_relative '../app/model/national_call'

describe 'TuristaPhonePlan' do
  plan = TuristaPhonePlan.new('55')
  it 'base cost of the plan equals 300' do
    expect(plan.base_cost).to eq 300
  end
  it 'name of the plan equals turista' do
    expect(plan.name).to eq 'turista'
  end
  context 'when making a local call' do
    random = '5401103034567'
    start_date_time = DateTime.new(2019, 3, 11, 14)
    end_date_time = DateTime.new(2019, 3, 11, 14, 1)
    call_to_random = LocalCall.new(PhoneNumber.new(random),
                                   start_date_time, end_date_time)
    it 'the call price shouldnt be affected' do
      expect(plan.cost(call_to_random)).to eq 3.2
    end
  end

  context 'when making a national call' do
    random = '5431403034567'
    start_date_time = DateTime.new(2019, 3, 11, 14)
    end_date_time = DateTime.new(2019, 3, 11, 14, 1)
    call_to_random = NationalCall.new(PhoneNumber.new(random),
                                      start_date_time, end_date_time)
    it 'the call price shouldnt be affected' do
      expect(plan.cost(call_to_random)).to eq 20
    end
  end
end
