require "thread"
require "net/http"

mutex = Mutex.new
@results = []

10.times.map do
    Thread.new do
        mutex.synchronize do
            response = Net::HTTP.get_response('dynamic.xkcd.com', 'random/comic/')
            random_comic_url = response['Location']

            @results << random_comic_url
        end
    end    
end.each(&:join)

puts @results