require_relative '../enumerables'

describe "enumerables" do
  let(:my_array) { [1, 2, 3, 4] }
  let(:my_hash) { { 'min': 1, 'max': 9 } }
  let(:my_range) { (1..3) }

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

   describe "my_all:" do

    it 'should return an Enumerator if block is not given' do
      expect(my_array.my_all?).to eql(true)
     end

    it "should return an array given the condition" do
      expect(my_array.my_all? { |elem| elem > 1} ).to eql(false)
    end

end