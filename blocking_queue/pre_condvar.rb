require "thread"

class BlockingQueue
  def initialize
    @storage = Array.new
    @mutex = Mutex.new
  end

  def push(item)
    @mutex.synchronize do
      @storage.push(item)
    end
  end

  def pop
    @mutex.synchronize do
      @storage.shift
    end
  end
end
