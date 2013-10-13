require "rspec"
require_relative "TilastEnumerable"

describe TilastEnumerable do

  describe "#map" do

    it "can get a block" do
    	arr = [1, 3, 6].extend TilastEnumerable
    	arr.map {|x| x * 2 }.should == [2, 6, 12]
    end

    it "can be used without block; so it returns input array" do
    	arr = [1, 3, 6].extend TilastEnumerable
    	arr.map.should == [1, 3, 6]
    end

    it "can get only arrays" do
    	str = "hello world".extend TilastEnumerable
    	str.map.should == "hello world"
    end

  end

  describe "#select" do

    it "can get a block" do
    	arr = [1, 3, 6].extend TilastEnumerable
    	arr.select {|x| x.odd? }.should == [1, 3]
    end

    it "can be used without block; so it returns input array" do
    	arr = [1, 3, 6].extend TilastEnumerable
    	arr.select.should == [1, 3, 6]
    end

    it "can get only arrays" do
    	str = "hello world".extend TilastEnumerable
    	str.select.should == "hello world"
    end

  end

  describe "#first" do

    it "returns first element of array" do
    	arr = [1, 3, 6].extend TilastEnumerable
    	arr.first.should == 1
    end

    it "can get only arrays" do
    	str = "hello world".extend TilastEnumerable
    	str.first.should == "hello world"
    end

  end

  describe "#last" do

  	it "returns last element of array" do
    	arr = [1, 3, 6].extend TilastEnumerable
    	arr.last.should == 6
    end

    it "can get only arrays" do
    	str = "hello world".extend TilastEnumerable
    	str.last.should == "hello world"
    end

  end

  describe "#include?" do

  	it "returns true if item exists in array" do
  		arr = [1, 3, 6].extend TilastEnumerable
    	arr.include?(3).should_not == false
  	end

  end

  describe "#reduce" do

  	it "can get two parameters - operation and start item" do
  		arr = [1, 3, 6].extend TilastEnumerable
  		arr.reduce(:*, 5).should == 90
  	end

  	it "can get one parameter - operation" do
  		arr = [1, 3, 6].extend TilastEnumerable
  		arr.reduce(:-).should == -10
  	end

  	it "can get one parameter - start item and operation '+' is default" do
  		arr = [1, 3, 6].extend TilastEnumerable
  		arr.reduce(3).should == 13
  	end

  end

end