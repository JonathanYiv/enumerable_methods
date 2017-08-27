require "enumerable_methods"

describe Enumerable do
	let(:array) { [1,2,3,4] }
	let(:answer) { [] }

	describe "#my_each" do
		it "goes through each element and performs the block on it" do
			array.my_each { |element| answer << element }
			expect(answer).to eq([1,2,3,4])
		end
	end

	describe "#my_each_with_index" do
		it "goes through each element and index and performs the block on it" do
			array.my_each_with_index { |element, index| answer << element; answer << index }
			expect(answer).to eq([1,0,2,1,3,2,4,3])
		end
	end

	describe "#my_select" do
		it "goes through each element and selects elements that meet the block condition" do
			answer = array.my_select { |element| element % 2 == 0 }
			expect(answer).to eq([2,4])
		end

		it "returns empty array if all elements do not meet the block condition" do
			answer = array.my_select { |element| element > 4 }
			expect(answer).to eq([])
		end
	end

	describe "#my_all?" do
		it "returns true if all elements meet the block condition" do
			answer = array.my_all? { |element| element < 5 }
			expect(answer).to be true
		end

		it "returns false if one of the elements does not meet the block condition" do
			answer = array.my_all? { |element| element != 2 }
			expect(answer).to be false
		end
	end

	describe "#my_any?" do
		it "returns true if at least one of the elements meets the block condition" do
			answer = array.my_any? { |element| element == 2 }
			expect(answer).to be true
		end

		it "returns false if none of the elements meet the block condition" do
			answer = array.my_any? { |element| element == 0 }
			expect(answer).to be false
		end
	end

	describe "#my_none?" do
		it "returns true if none of the elements meet the block condition" do
			answer = array.my_none? { |element| element == 100 }
			expect(answer).to be true
		end

		it "returns false if one of the elements meet the block condition" do
			answer = array.my_none? { |element| element == 4 }
			expect(answer).to be false
		end
	end

	describe "#my_count" do
		it "returns a count of how many elements meet the block condition" do
			answer = array.my_count { |element| element > 2 }
			expect(answer).to eq(2)
		end
	end

	describe "#my_map" do
		it "returns a new array with the elements modified by the block" do
			answer = array.my_map { |element| element + 2 }
			expect(answer).to eq([3,4,5,6])
		end
	end

	describe "#my_inject" do
		it "takes a parameter and yields to the block and returns the modified parameter" do
			answer = array.my_inject(0) { |sum, element| sum += element }
			expect(answer).to eq(10)
		end
	end
end