def valid_triangle?(a, b, c)
  a+b > c && b+c > a && a+c > b
end

def read_file_as_rows(filename)
  rows = []
  File.readlines(filename).each {|row| rows << row.split }
  rows
end

# part A
# valid_triangles_count = 0
# file_rows = read_file_as_rows('day_3_input.txt')
# file_rows.each do |row|
#   valid_triangles_count += 1 if valid_triangle?(row[0].to_i, row[1].to_i, row[2].to_i)
# end
# puts valid_triangles_count
