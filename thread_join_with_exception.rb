thread = Thread.new do
	raise 'hell'
end

sleep 3

thread.join