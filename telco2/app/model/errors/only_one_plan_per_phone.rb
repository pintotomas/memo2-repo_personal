class OnlyOnePlanPerPhone < RuntimeError
  def initialize(msg = 'A phone cant be registered in more than one plan!')
    super
  end
end
