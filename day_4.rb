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

def real_room?(name, checksum)
  encrypted_name(name) == checksum
end

def parse_line(line)
  regex_result = line.match /^(\D+)-(\d+)\[([a-z]+)\]$/
  {name: regex_result[1], sector_id: regex_result[2].to_i, checksum: regex_result[3]}
end

def sum_valid_room_sector_ids(filename)
  sector_ids_sum = 0
  File.readlines(filename).each do |line|
    parsed_line = parse_line(line)
    sector_ids_sum += parsed_line[:sector_id] if real_room?(parsed_line[:name], parsed_line[:checksum])
  end

  sector_ids_sum
end

# Part A
# puts sum_valid_room_sector_ids('day_4_input.txt')

##########################################

# Part B
