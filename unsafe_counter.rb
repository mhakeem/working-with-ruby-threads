@counter = 0

5.times.map do
	Thread.new do
		temp = @counter
		temp = temp + 1

		@counter = temp
	end
end.each(&:join)

puts @counter