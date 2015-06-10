module FunWithStrings
  def palindrome?
    str = downcase.gsub(/[0-9,\-.'\s+!]/, '')
    str == str.reverse
  end

  def count_words
    str = downcase.gsub(/[0-9,\-.'+!]/, '')
    map = Hash.new(0)
    str.split.each { |s| map[s] += 1 }
    map
  end

  def anagram_groups
    split.group_by { |word| word.downcase.chars.sort }.values
  end
end

# make all the above functions available as instance methods on Strings:

class String
  include FunWithStrings
end
