Given /^the sequence ((?:\d+,)*(?:\d+))$/ do |digits|
  @digits = digits.split(',').collect(&:to_i)
end

When /^I check the sequence$/ do
  @result = UniqueSequence::Checker.check(@digits)
end

Then /^it should be valid$/ do
  @result.should be_true
end

Then /^it should be invalid$/ do
  @result.should be_false
end

Given /^a new generator$/ do
  @generator = UniqueSequence::Generator.new
end

When /^I ask for a unique sequence$/ do
  @sequence = @generator.get_next
end

Then /^I should receive a valid unique sequence$/ do
  UniqueSequence::Checker.check(@sequence).should be_true
end
