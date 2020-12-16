require_relative '../enumerables'

describe "enumerables" do
  let(:my_array) { [1, 2] }
  let(:my_hash) { { min: 1, max: 9 } }
  let(:my_range) { (1..3) }

  describe "my_each:" do
    it 'should return an Enumerator if block is not given' do
      expect(my_array.my_each).to be_a(Enumerator)
    end

    it 'should return a list(array) if block is given' do
      expect(my_array.my_each{ |elem| puts elem}).to eql(my_array) 
    end

    it 'should return a list(hash) if block is given' do
      expect(my_hash.my_each{ |k, v| puts "Key: #{k} , Value: #{v}"}).to eql(my_hash) 
    end

    it 'should return a range if block is given' do
      expect(my_range.my_each{ |elem| puts elem }).to equal(my_range) 
    end
  end
  
  describe "my_each_with_index:" do
    it 'should return an Enumerator if block is not given' do
      expect(my_array.my_each_with_index).to be_a(Enumerator)
    end

    it 'should return a list(array) if block is given' do
      expect(my_array.my_each{ |elem, index| puts "#{elem}, #{index}" }).to eql(my_array) 
    end

    it 'should return a list(hash) if block is given' do
      expect(my_hash.my_each{ |k, v| puts "Key: #{k} , Value: #{v}"}).to eql(my_hash) 
    end

    it 'should return a range if block is given' do
      expect(my_range.my_each{ |elem| puts elem }).to equal(my_range) 
    end
  end

  describe "my_select:" do
    it 'should return an Enumerator if block is not given' do
      expect(my_array.my_select).to be_a(Enumerator)
    end

    it "she" do
      expect(my_array.my_select(&:even?
    end
  end

end