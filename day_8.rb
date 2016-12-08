def create_screen(w, h)
  screen = []
  h.times { screen << ("."*w).split("") }
  screen
end

# rect AxB turns on all of the pixels in a rectangle at the
# top-left of the screen which is A wide and B tall.
def rect(a, b, screen)
  screen[0...b].each do |row|
    row[0...a] = ("#"*a).split("")
  end

  screen
end

# rotate row y=A by B shifts all of the pixels in row A
# (0 is the top row) right by B pixels. Pixels that would
# fall off the right end appear at the left end of the row.
def rotate_row(a, b, screen)
  edge = screen[a].pop(b)
  screen[a].unshift(edge)
  screen[a].flatten!

  screen
end

# rotate column x=A by B shifts all of the pixels in
# column A (0 is the left column) down by B pixels.
# Pixels that would fall off the bottom appear at the top
# of the column.
def rotate_column(a, b, screen)
  column = []
  screen.each { |row| column << row[a] }

  edge = column.pop(b)
  column.unshift(edge)
  column.flatten!

  screen.each_with_index do |row, i|
    row[a] = column[i]
  end

  screen
end

def parse_instruction(line)
  pieces = line.split

  if pieces[1] == "row"
    command = :rotate_row
    a = pieces[2].sub("y=","")
    b = pieces[-1]
  elsif pieces[1] == "column"
    command = :rotate_column
    a = pieces[2].sub("x=","")
    b = pieces[-1]
  else
    command = :rect
    a, b = pieces[1].split("x")
  end

  {command: command, a: a.to_i, b: b.to_i}
end

def answer_part_a(filename)
  screen = create_screen(50, 6)

  File.readlines(filename).each do |line|
    instruction = parse_instruction(line)

    send(instruction[:command], instruction[:a], instruction[:b], screen)
  end

  on_pixel_count = 0
  screen.each {|row| on_pixel_count += row.count("#")}
  on_pixel_count
end

# puts answer_part_a("day_8_input.txt")
