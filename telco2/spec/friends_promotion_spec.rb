require_relative '../app/model/friends_promotion'
describe 'FriendsPromotion' do
  context 'when plan has been created' do
    friends_promotion = FriendsPromotion.new
    it 'Cost of the plan' do
      expect(friends_promotion.base_cost).to eq 100
    end
    it 'Name of the plan' do
      expect(friends_promotion.name).to eq 'amigos'
    end
  end
end
