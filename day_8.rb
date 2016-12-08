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
