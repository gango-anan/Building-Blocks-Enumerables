require_relative '../enumerables'

describe "enumerables" do
  let(:my_array) { [1, 2, 3, 4,] }
  let(:my_hash) { { 'min': 1, 'max': 9 } }
  let(:my_range) { (1..3) }
  let(:my_array2) { [] }
  let(:test) {[true, false, nil]}

  # describe "my_each:" do
  #   it 'should return an Enumerator if block is not given' do
  #     expect(my_array.my_each).to be_a(Enumerator)
  #   end

  #   it 'should return a list(array) if block is given' do
  #     expect(my_array.my_each{ |elem| puts elem}).to eql(my_array) 
  #   end

  #   it 'should return a list(hash) if block is given' do
  #     expect(my_hash.my_each{ |k, v| puts "Key: #{k} , Value: #{v}"}).to eql(my_hash) 
  #   end

  #   it 'should return a range if block is given' do
  #     expect(my_range.my_each{ |elem| puts elem }).to equal(my_range) 
  #   end
  # end
  
  # describe "my_each_with_index:" do
  #   it 'should return an Enumerator if block is not given' do
  #     expect(my_array.my_each_with_index).to be_a(Enumerator)
  #   end

  #   it 'should return a list(array) if block is given' do
  #     expect(my_array.my_each{ |elem, index| puts "#{elem}, #{index}" }).to eql(my_array) 
  #   end

  #   it 'should return a list(hash) if block is given' do
  #     expect(my_hash.my_each{ |k, v| puts "Key: #{k} , Value: #{v}"}).to eql(my_hash) 
  #   end

  #   it 'should return a range if block is given' do
  #     expect(my_range.my_each{ |elem| puts elem }).to equal(my_range) 
  #   end
  # end

  # describe "my_select:" do
  #   it 'should return an Enumerator if block is not given' do
  #     expect(my_array.my_select).to be_a(Enumerator)
  #   end

  #   it "should return an array given the condition" do
  #     expect(my_array.my_select { |elem| elem != 1} ).to eql([2, 3, 4])
  #   end

  #   it "should return a key and a value given the condition" do
  #     expect(my_hash.my_select { |k , v| v != 1} ).to eql([[:max, 9]])
  #   end

  #   it "should return an array" do
  #     expect(my_range.my_select { |elem| elem != 1} ).to eql([2, 3])
  #   end

  # end

  #  describe "my_all:" do

  #   it 'should return an Enumerator if block is not given' do
  #     expect(my_array.my_all?).to eql(true)
  #    end

  #   it "should return an array given the condition" do
  #     expect(my_array.my_all? { |elem| elem > 1} ).to eql(false)
  #   end
  # end

  # describe "my_any:" do
  #   it "returns true if not given and atleast has one element not false or nil" do
  #     expect(my_array2.my_any?).to eql(false)
  #   end

  #   it "returns false based on the condition in the block" do
  #     expect(my_array.my_any?{ |elem| elem > 10 }).to eql(false)
  #   end

  #   it "returns true if the block returns a value other than false or nil" do
  #     expect(my_array.my_any?{ |elem| elem < 10 }).to eql(true)
  #   end
  # end

  # describe "my_none:" do
  #   it "returns true if the block is not given, and none of the collection members is true" do
  #     expect(test.my_none?).to eql(false)
  #   end

  #   it "returns true if the block never returns true" do
  #     expect(my_array.my_none?{ |elem| elem > 10}).to eql(true)
  #   end
  # end

  # describe "my_count:" do
  #   it "returns number of elements in a list if a block is not given" do
  #     expect(my_array.my_count).to eql(4)
  #   end

  #   it "if passed argument, returns number of elements equal to argument" do
  #     expect(my_array.my_count(2)).to eql(1)
  #   end
  # end

  # describe "my_map:" do
  #   it "returns and enumerator if no block is given " do
  #     expect(my_array.my_map).to be_an(Enumerator)
  #   end

  #   it "if block is given returns an array based on the block" do
  #     expect(my_array.my_map{ |elem| elem*2 }).to eql([2, 4, 6, 8])
  #   end
  # end

  describe "my_inject:" do
    it "if a symbol is given, returns a value based on the symbol" do
      expect(my_range.my_inject(:+)).to eql(6)
    end

    it "if a block is given returns a value based on the block" do
      expect(my_range.my_inject{ |sum, num| sum + num }).to eql(6)
    end
  end

end