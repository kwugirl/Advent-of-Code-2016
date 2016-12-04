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

def encrypted_name(plaintext_name)
  letter_freq = count_letter_frequencies(plaintext_name)
  letters_grouped_by_counts = group_letters_by_count(letter_freq)

  encrypted_name = ''
  letters_grouped_by_counts.sort.reverse.each do |grouping|
    encrypted_name << grouping[1]
    return encrypted_name[0..4] if encrypted_name.length >= 5
  end
end
