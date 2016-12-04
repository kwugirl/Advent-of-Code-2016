class Position
  attr_accessor :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end

  def ==(another_position)
    self.x == another_position.x && self.y == another_position.y
  end
end

# Each line of instructions corresponds to one button, starting
# at the previous button (or, for the first line, the "5" button);
# press whatever button you're on at the end of each line.
# If a move doesn't lead to a button, ignore it.
def new_position(old_position, instruction)
  new_position = old_position.dup

  case instruction
  when "U"
    new_position.y -= 1 unless new_position.y == 0
  when "D"
    # there should probably be a better way to validate whether a
    # move should be ignored than hardcoding in here an assumption
    # about having 3x3 keypad
    new_position.y += 1 unless new_position.y == 2
  when "L"
    new_position.x -= 1 unless new_position.x == 0
  when "R"
    new_position.x += 1 unless new_position.x == 2
  end

  new_position
end

def determine_next_position(old_position, instructions)
  current_position = old_position

  (0...instructions.length).each do |i|
    current_position = new_position(current_position, instructions[i])
  end

  current_position
end

keypad = [
  [1, 2, 3],
  [4, 5, 6],
  [7, 8, 9]
]

