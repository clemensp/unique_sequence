module UniqueSequence
  class Generator
    @@SUM = 15
    @@RANGE = (1..9)

    def get_next(sequence = nil)
      sequence ? get_next_from_sequence(sequence) : [1]
    end

    def get_next_from_sequence(sequence)
      to_add = sequence[-1] == sequence[-2] ? sequence[-1] + 1 : sequence[-1]
      sum = sequence.inject(:+) 
      if sequence == [9]
        sequence = nil
      elsif sum + to_add <= @@SUM
        sequence << to_add
      elsif sequence[-1] == 9 || sum == 15
        sequence = sequence[0..-2]
        sequence[-1] += 1
      else
        sequence[-1] += 1
      end
      sequence
    end

    def get_all_valid
      sequences = []
      sequence = get_next
      while sequence
        sequences << sequence if Checker.check(sequence)
        sequence = get_next(sequence)
      end 
      sequences
    end
  end
end
