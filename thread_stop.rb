thread = Thread.new do
	Thread.stop
	puts 'Hello there'
end

nil until thread.status == 'sleep'

thread.wakeup
thread.join