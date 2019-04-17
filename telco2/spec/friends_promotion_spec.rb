require_relative '../app/model/friends_promotion'
require_relative '../app/model/errors/friend_promotion_limit_reached'
require 'rspec/mocks'
describe 'FriendsPromotion' do
  context 'when plan has been created' do
    friends_promotion = FriendsPromotion.new
    it 'Cost of the plan' do
      expect(friends_promotion.base_cost).to eq 200
    end
    it 'Name of the plan' do
      expect(friends_promotion.name).to eq 'amigos'
    end
  end

  context 'when adding friends' do
    friends_promotion = FriendsPromotion.new
    it 'adding more friends than the limit causes FriendPromotionLimitReached' do
      friends_promotion.add_friend(instance_double('phone'))
      friends_promotion.add_friend(instance_double('phone'))
      friends_promotion.add_friend(instance_double('phone'))
      expect do
        friends_promotion.add_friend(
          instance_double('phone')
        )
      end .to raise_error(FriendPromotionLimitReached)
    end
  end
end
