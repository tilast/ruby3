module TilastEnumerable
	
	def map
		return self unless self.is_a?(Array)

		unless block_given?
			self
		else
			result = []
			self.each { |item| result << yield(item) }
			result
		end
	end

	def select
		return self unless self.is_a?(Array)

		unless block_given?
			self
		else
			result = []
			self.each { |item| result << item if yield(item) }
			result
		end
	end

    def reduce (*args)
    	result = 0
    	operation = :+

    	if args.size > 1 and args[0].is_a? Symbol
    		operation, result = args
    	elsif args.size == 1
    		if args[0].is_a?(Symbol)
    			operation = args[0]
    		else
    			result = args[0]
    		end
    	end

    	self.each do |item|
    		result = result.send(operation, item)
    	end

    	result
    end

    def first
    	return self unless self.is_a?(Array)
    	self[0]
    end

    def last
    	return self unless self.is_a?(Array)
    	self[-1]
    end

    def include? (val)
    	self.each { |item| return true if item == val }
    	false
    end
end