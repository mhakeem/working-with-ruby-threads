adder = Thread.new do
	puts Thread.current.status
	2 * 3
end

puts adder.status
adder.join
puts adder.status