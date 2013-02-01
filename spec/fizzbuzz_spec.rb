require './spec/spec_helper'

describe FizzBuzz do
  context "#determine_response" do
    it "should return 'Fizz' on a number evenly divisible by 3" do
      FizzBuzz.determine_response(6).should == "Fizz"
    end

    it "should return 'Buzz' on a number evenly divisible by 5" do
      FizzBuzz.determine_response(10).should == "Buzz"
    end

    it "should return 'FizzBuzz' on a number evenly divisible by both 3 and 5" do
      FizzBuzz.determine_response(15).should == "FizzBuzz"
    end

    it "should return the number when divisible by neither 3 or 5" do
      FizzBuzz.determine_response(7).should == 7
    end
  end
end
