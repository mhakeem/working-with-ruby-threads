# Another demonstrations of a thread-unsafe code

shared_array = Array.new

10.times.map do
    Thread.new do
        1000.times do
            shared_array << nil
        end
    end
end.each(&:join)

puts shared_array.size