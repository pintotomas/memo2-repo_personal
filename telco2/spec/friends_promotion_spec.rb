require_relative '../app/model/friends_phone_plan'
require_relative '../app/model/errors/friend_promotion_limit_reached'
require_relative '../app/model/phone_number'
require_relative '../app/model/local_call'
require 'rspec/mocks'
require 'byebug'
describe 'FriendsPhonePlan' do
  context 'when plan has been created' do
    friends_phone_plan = FriendsPhonePlan.new
    it 'Cost of the plan' do
      expect(friends_phone_plan.base_cost).to eq 200
    end
    it 'Name of the plan' do
      expect(friends_phone_plan.name).to eq 'amigos'
    end
  end

  context 'when adding friends' do
    friends_phone_plan = FriendsPhonePlan.new
    it 'adding more friends than the limit causes FriendPromotionLimitReached' do
      friends_phone_plan.add_friend(instance_double('phone'))
      friends_phone_plan.add_friend(instance_double('phone'))
      friends_phone_plan.add_friend(instance_double('phone'))

      expect do
        friends_phone_plan.add_friend(
          instance_double('phone')
        )
      end .to raise_error(FriendPromotionLimitReached)
    end
  end

  context 'when asking for the price of a call' do
    friends_phone_plan = FriendsPhonePlan.new
    friend_phone_number = PhoneNumber.new('5401155556666')
    random = PhoneNumber.new('5401103034567')
    friends_phone_plan.add_friend(friend_phone_number)
    start_date_time = DateTime.new(2019, 3, 11, 14)
    end_date_time = DateTime.new(2019, 3, 11, 14, 1)
    call_to_friend = LocalCall.new(friend_phone_number, start_date_time, end_date_time)
    call_to_random = LocalCall.new(random, start_date_time, end_date_time)
    it 'price of call to friend should be 0' do
      expect(friends_phone_plan.cost(call_to_friend)).to eq 0
    end
    it 'price of a call to a random shouldnt be 0' do
      expect(friends_phone_plan.cost(call_to_random)).to eq 3.2
    end
  end
end
