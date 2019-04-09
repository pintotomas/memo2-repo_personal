class CallRegistry
  def initialize(calls = [])
    @call_registry = calls
  end

  def push(call)
    @call_registry << call
  end

  def each(&block)
    @call_registry.each(&block)
    self # return the original array
  end

  def length
    @call_registry.length
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
