$cleaned_up = false

t = Thread.new do
	begin
		# 
	ensure
		sleep
		$cleaned_up = true
	end
end

nil until t.status == 'sleep'

t.raise 'hell'

begin
	t.join
rescue
end

puts $cleaned_up