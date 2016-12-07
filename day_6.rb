def set_up_counter(number_of_columns)
  freq_counts = []

  number_of_columns.times do
    letter_counts = Hash[('a'..'z').to_a.map {|x| [x, 0]}]
    letter_counts[:most_frequent] = {highest_count: 0, letters: []}
    freq_counts << letter_counts
  end

  freq_counts
end

def process_input(input)
  freq_counts = set_up_counter(input.first.length)

  input.each do |row|
    row.split('').each_with_index do |letter, i|
      freq_counts[i][letter] += 1

      if freq_counts[i][letter] > freq_counts[i][:most_frequent][:highest_count]
        freq_counts[i][:most_frequent][:highest_count] = freq_counts[i][letter]
        freq_counts[i][:most_frequent][:letters] = [letter]
      elsif freq_counts[i][letter] == freq_counts[i][:most_frequent][:highest_count]
        freq_counts[i][:most_frequent][:letters] << letter
      end
    end
  end

  freq_counts
end

def derive_correct_password(input)
  freq_counts = process_input(input)

  password = []
  freq_counts.each {|counter| password << counter[:most_frequent][:letters]}

  password.join
end

def read_file(filename)
  File.read(filename).split("\n")
end

# Part A
# input = read_file('day_6_input.txt')
# puts derive_correct_password(input)
