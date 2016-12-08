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
