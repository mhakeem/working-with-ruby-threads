require "celluloid/autostart"
require "net/http"

class XKCDFetcher
    include Celluloid

    def next
        response = Net::HTTP.get_response('dynamic.xkcd.com', '/random/comic/')
        random_comic_url = response['Location']

        random_comic_url
    end
end