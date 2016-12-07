def has_an_abba?(str)
  characters = str.split("")
  second_to_last_index = characters.length - 2

  (2..second_to_last_index).each do |i|
    if characters[i] == characters[i-1] &&
      characters[i] != characters[i+1] &&
      characters[i+1] == characters[i-2]

      return true
    end
  end

  false
end

def supports_tls?(str)
  hypernet_sequences = str.scan(/\[(\w+)\]/).flatten

  hypernet_sequences.each do |section|
    return false if has_an_abba?(section)
  end

  non_bracketed_strings = str.scan(/(\w*)\[\w+\](\w*)/).flatten

  non_bracketed_strings.each do |section|
    return true if has_an_abba?(section)
  end

  false
end

def count_tls_supporting_addresses(filename)
  count = 0
  File.readlines(filename).each do |line|
    if supports_tls?(line)
      count += 1
    end
  end

  count
end

# puts count_tls_supporting_addresses('day_7_input.txt')
