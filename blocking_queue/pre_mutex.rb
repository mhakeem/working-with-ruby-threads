class BlockingQueue
  def initialize
    @storage = Array.new
  end

  def push(item)
    @storage.push(item)
  end

  def pop
    @storage.shift
  end
end
