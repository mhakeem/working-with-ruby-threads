require "thread"

class BlockingQueue
  def initialize
    @storage = Array.new
    @mutex = Mutex.new
    @condvar = ConditionalVariable.new
  end

  def push(item)
    @mutex.synchronize do
      @storage.push(item)
      @condvar.signal
    end
  end

  def pop
    @mutex.synchronize do
      while @storage.empty?
        @condvar.wait(@mutex)
      end

      @storage.shift
    end
  end
end
