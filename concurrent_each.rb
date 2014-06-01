module Enumerable
    def concurrent_each
        threads = []

        each do |element|
            threads << Thread.new {
                yield element
            }
        end

        threads.each(&:join)
    end
end