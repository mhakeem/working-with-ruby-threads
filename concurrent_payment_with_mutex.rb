# This implementation is still not thread safe because Mutex is not at the right place

class Order
    attr_accessor :amount, :status

    def initialize(amount, status)
        @amount, @status = amount, status
        @mutex = Mutex.new
    end
    
    def pending?
        status == 'pending'
    end

    def collect_payment
        @mutex.synchronize do
            puts 'Collecting payment...'
            self.status = 'paid'
        end
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