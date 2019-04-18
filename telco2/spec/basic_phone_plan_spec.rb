require_relative '../app/model/basic_phone_plan'
require_relative '../app/model/phone_number'
require_relative '../app/model/local_call'
require_relative '../app/model/international_call'

describe 'BasicPhonePlan' do
  basic_phone_plan = BasicPhonePlan.new
  it 'name of the plan should be ninguno' do
    expect(basic_phone_plan.name).to eq 'ninguno'
  end
  it 'cost of the plan should be 100' do
    expect(basic_phone_plan.base_cost).to eq 100
  end
  context 'when making a local call' do
    friend_phone_number = PhoneNumber.new('5401155556666')
    start_date_time = DateTime.new(2019, 3, 11, 14)
    end_date_time = DateTime.new(2019, 3, 11, 14, 1)
    call_to_friend = LocalCall.new(friend_phone_number, start_date_time, end_date_time)
    it 'cost of a call should not be affected' do
      expect(basic_phone_plan.cost(call_to_friend)).to eq 3.2
    end
  end

  context 'when making a national call' do
    friend_phone_number = PhoneNumber.new('5201155556666')
    start_date_time = DateTime.new(2019, 3, 11, 14)
    end_date_time = DateTime.new(2019, 3, 11, 14, 1)
    call_to_friend = InternationalCall.new(friend_phone_number, start_date_time, end_date_time)
    it 'cost of a call should not be affected' do
      expect(basic_phone_plan.cost(call_to_friend)).to eq 10
    end
  end
end
