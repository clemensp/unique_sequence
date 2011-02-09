require 'spec_helper'

module UniqueSequence
  describe Checker do
    describe "#check" do
      it "should be true for a valid sequence" do
        Checker.check([1,1,2,3,8]).should be_true
      end

      context "invalid sequences" do
        it "should be false for an invalid sum" do
          Checker.check([1,1,2,3,9]).should be_false
        end

        it "should be false when no digits appear twice" do
          Checker.check([1,2,3,4,5]).should be_false
          Checker.check([2,4,9]).should be_false
        end

        it "should be false when a digit is not between 1 and 9" do
          Checker.check([15]).should be_false
          Checker.check([1,14]).should be_false
          Checker.check([2,13]).should be_false
        end

        it "should be false when a digit appears more than 2 times" do
          Checker.check([1,2,3,3,3,3]).should be_false
          Checker.check([1,1,1,3,3,3,3]).should be_false
        end
      end
    end

    describe "#check_repeating_digit" do
      it "should be true if there are repeating digits" do
        Checker.check_repeating_digit([1,3,3]).should be_true
        Checker.check_repeating_digit([1,3,3,4]).should be_true
      end
    end
  end
end
