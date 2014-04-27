# This code is not thread safe and will give innacurate results on each run.

Order = Struct.new(:amount, :status) do
	def pending?
		status == 'pending'
	end

	def collect_payment
		puts 'Collecting payment...'
		self.status = 'paid'
	end
end

order = Order.new(100.00, 'pending')

5.times.map do
	Thread.new do
		if order.pending?
			order.collect_payment
		end
	end
end.each(&:join)