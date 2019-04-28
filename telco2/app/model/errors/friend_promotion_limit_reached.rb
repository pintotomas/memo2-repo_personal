class FriendPromotionLimitReached < RuntimeError
  def initialize(msg = 'You cant add anymore friends!')
    super
  end
end
