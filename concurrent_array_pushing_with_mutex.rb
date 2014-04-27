# Same as concurrent_array_pushing.rb, but now it is thread safe

shared_array = Array.new
mutex = Mutex.new

10.times.map do
    Thread.new do
        1000.times do
            mutex.lock
            shared_array << nil
            mutex.unlock
        end
    end
end.each(&:join)

puts shared_array.size