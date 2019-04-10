class CallRegistry
  def initialize(calls = [])
    @registry = calls
  end

  def push(call)
    @registry << call
  end

  def each(&block)
    @registry.each(&block)
    self # return the original array
  end

  def length
    @registry.length
  end

  def select
    # returns a new call registry with the selected calls
    result = []
    each do |call|
      result << call if yield(call) == true
    end
    CallRegistry.new(result)
  end
end
