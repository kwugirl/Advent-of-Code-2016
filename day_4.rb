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

def sum_valid_room_sector_ids(filename)
  sector_ids_sum = 0
  File.readlines(filename).each do |line|
    parsed_line = line.match /^(\D+)(\d+)\[([a-z]+)\]$/
    name = parsed_line[1]
    sector_id = parsed_line[2].to_i
    checksum = parsed_line[3]

    sector_ids_sum += sector_id if real_room?(name, checksum)
  end

  sector_ids_sum
end

# puts sum_valid_room_sector_ids('day_4_input.txt')
