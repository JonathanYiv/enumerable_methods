module Enumerable

	def my_each 
		for element in self
			yield(element)
		end
		self
	end

	def my_each_with_index
		i = 0
		for element in self
			yield(element,i)
			i += 1
		end
		self
	end

=begin
	def my_select
		selected = []
		for element in self
			selected.push(element) if yield(element) != false
		end
		selected
	end
=end

	def my_select
		selected = [] if self.class == Array
		selected = {} if self.class == Hash
		self.my_each do |element|
			selected.push(element) if yield(element) != false
		end
		selected
	end

	def my_all?
		all = true
		self.my_each do |element|
			all = false if yield(element) == false
		end
		all
	end

	def my_any?
		any = false
		self.my_each do |element|
			any = true if yield(element) == true
		end
		any
	end

	def my_none?
		none = true
		self.my_each do |element|
			none = false if yield(element) == true
		end
		none
	end

	def my_count
		count = 0
		self.my_each do |element|
			if block_given?
				count += 1 if yield(element) != false
			else
				count +=1
			end
		end
		count
	end

	def my_map(proc=nil)
		mapped = []
		unless proc && proc.class == proc
			self.my_each do |element|
				mapped.push(proc.call(element))
			end
		else
			self.my_each do |element|
				mapped.push(yield(element))
			end
		end
		mapped
	end

	def my_inject(value=self[0])
		value ||= []
		self.my_each do |element|
			value = yield(value, element) 
		end
		value 
	end
end

def multiply_els(array)
	array.my_inject(1) { |value, element| value * element }
end

multiply_els([2,4,5])