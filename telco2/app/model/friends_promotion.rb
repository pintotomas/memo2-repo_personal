require_relative 'errors/friend_promotion_limit_reached'
class FriendsPromotion
  FRIEND_LIMIT = 3
  FRIEND_CALL_COST = 0
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

  def cost(call)
    return call.cost unless is_friend? call.phone_number_destiny

    FRIEND_CALL_COST
  end

  private

  def is_friend?(phone)
    @friends.include? phone
  end
end
