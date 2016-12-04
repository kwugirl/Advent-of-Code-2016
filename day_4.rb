def count_letter_frequencies(str)
  freq = Hash.new(0)
  str.each_char {|char| freq[char] += 1 unless char == '-' }
  freq
end

def group_letters_by_count(freq)
  grouping = {}
  freq.each do |letter, count|
    grouping[count] = "#{grouping[count]}#{letter}".chars.sort.join
  end
  grouping
end
