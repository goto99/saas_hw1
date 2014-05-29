module FunWithStrings
  def palindrome?
    new_str = self.downcase.gsub(/\W/," ")
    s = ""
    new_str.chars.each do |c|
      if c != " "
        s << c
      end
    end
    return  s == s.reverse
  end

  def count_words
    count = Hash.new(0)
    words = self.downcase.split(/\W/)
    words.delete("")
    words.each do |w|
      count[w] += 1
    end
    count
  end

  def anagram_groups
    words = self.split(/\W/)
    words.delete("")
    counts = Hash.new()
    words.each do |word|
      w = word.downcase
      count = Hash.new(0)
      w.chars.each do |char|
        count[char] += 1
      end
      if counts[count.sort()] == nil
        counts[count.sort()] = Array[word]
      else
        counts[count.sort()] << word
      end
    end
    groups = []
    counts.each do |k, v|
      groups << v
    end
    groups
  end
end

# make all the above functions available as instance methods on Strings:

class String
  include FunWithStrings
end
