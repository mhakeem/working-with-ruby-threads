require "thread"
require "net/http"

mutex = Mutex.new
condvar = ConditionVariable.new
results = Array.new

Thread.new do
    10.times do
        response = Net::HTTP.get_response('dynamic.xkcd.com', 'random/comic/')
        random_comic_url = response['Location']

        mutex.synchronize do
            results << random_comic_url
            condvar.signal
        end
    end    
end

comics_received = 0

until comics_received >= 10
    mutex.synchronize do
        while results.empty?
            condvar.wait(mutex)
        end

        url = results.shift
        puts "You should check out #{url}"
    end

    comics_received += 1
end

puts results