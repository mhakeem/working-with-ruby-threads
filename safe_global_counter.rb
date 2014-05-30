require "thread"

class Counter
  def initialize
    @counter = 0
    @mutex = Mutex.new
  end
  
  def incerement
    @mutex.synchronize do
      @counter += 1
    end
  end
  
end

$counter = Counter.new