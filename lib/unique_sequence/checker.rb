module UniqueSequence
  class Checker
    def self.check(digits)
      check_valid_digits(digits) && 
        check_sum(digits) && 
        check_repeating_digit(digits) && 
        check_digits_appearing_less_than_three_times(digits)
    end

    def self.check_valid_digits(digits)
      digits.inject(true) do |valid, digit|
        break false unless valid
        (1..9) === digit 
      end
    end

    def self.check_sum(digits)
      digits.inject do |sum, digit|
        sum += digit
      end == 15
    end

    def self.check_repeating_digit(digits)
      digits.sort.inject do |previous, current|
        break true if previous == current
      end ? true : false
    end

    def self.check_digits_appearing_less_than_three_times(digits)
      count_set = digits.inject(Hash.new(0)) do |count_set, digit|
        count_set[digit.to_s] += 1
        count_set
      end
      count_set.find do |key, value|
        value > 2
      end ? false : true
    end
  end
end
