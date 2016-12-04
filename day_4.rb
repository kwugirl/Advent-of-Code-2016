def count_letter_frequencies(str)
  freq = Hash.new(0)
  str.each_char {|char| freq[char] += 1 unless char == '-' }
  freq
end
