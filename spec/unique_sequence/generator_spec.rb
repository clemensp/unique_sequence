require 'spec_helper'

module UniqueSequence
  describe Generator do
    let(:generator) { Generator.new }

    describe "#get_next" do
      it "should return an array" do
        generator.get_next.class.should == Array
      end

      it "should return [1] as the first sequence" do
        sequence = generator.get_next
        sequence.should == [1]
      end

      context "last digit not repeated" do
        it "should return with the last element repeated" do
          sequence = generator.get_next([1])
          sequence.should == [1,1]
        end

        it "should return with the second last element incremented and cut the trailing if the last digit is 9" do
          sequence = generator.get_next([1,9])
          sequence.should == [2]
        end
      end

      context "last digit repeated" do
        it "should return with the last element incremented by 1 appended" do
          sequence = generator.get_next([1,1])
          sequence.should == [1,1,2]
        end
      end

      it "should increment the second last element by 1 and cut the trailing if the digit if the sum is greater than @@SUM" do
        sequence = generator.get_next([1,1,2,2,3,3])
        sequence.should == [1,1,2,2,3,4]
      end

      it "should be nil if the sequence is [9]" do
        sequence = generator.get_next([9])
        sequence.should be_nil
      end
    end

    describe "get_all_valid" do
      it "should return 38 sequences" do
        sequences = generator.get_all_valid
        sequences.should have(38).sequences
      end
    end
  end
end
