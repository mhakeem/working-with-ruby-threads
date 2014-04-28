require "thread"
require "net/http"

mutex = Mutex.new
threads = []
results = []

10.times.map do
    threads << Thread.new do
        response = Net::HTTP.get_response('dynamic.xkcd.com', 'random/comic/')
        random_comic_url = response['Location']

         mutex.synchronize do
            results << random_comic_url
        end
    end    
end

threads.each(&:join)
puts results