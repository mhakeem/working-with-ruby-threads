require "celluloid/autostart"
require "net/http"

class XKCDFetcher
    include Celluloid

    def next
        response = Net::HTTP.get_response('dynamic.xkcd.com', 'random/comic/')
        random_comic_url = response['Location']

        random_comic_url
    end
end

fetcher = XKCDFetcher.new

# puts fetcher.object_id
# puts fetcher.inspect

# puts fetcher.async.next
# puts fetcher.async.next
futures = []

10.times do
    futures << fetcher.future.next
end

futures.each do |future|
    puts "You should check out #{future.value}"
end