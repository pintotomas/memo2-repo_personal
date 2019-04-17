require_relative 'errors/friend_promotion_limit_reached'
class FriendsPromotion
  FRIEND_LIMIT = 3
  def initialize
    @base_cost = 200
    @name = 'amigos'
    @friends = []
  end
  attr_reader :base_cost
  attr_reader :name

  def add_friend(phone)
    raise FriendPromotionLimitReached unless @friends.length < FRIEND_LIMIT

    @friends << phone
  end
end
