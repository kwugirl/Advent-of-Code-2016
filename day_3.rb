def valid_triangle?(a, b, c)
  a+b > c && b+c > a && a+c > b
end

# part A
# valid_triangles_count = 0
# File.readlines('day_3_input.txt').each do |line|
#   lengths = line.split
#   valid_triangles_count += 1 if valid_triangle?(lengths[0].to_i, lengths[1].to_i, lengths[2].to_i)
# end
# puts valid_triangles_count
