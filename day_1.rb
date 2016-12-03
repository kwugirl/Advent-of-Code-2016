# direction_mapping = {
#   0 => :north,
#   1 => :east,
#   2 => :south,
#   3 => :west
# }

def next_direction(current_direction, turn_direction)
  case turn_direction
  when "L"
    (current_direction - 1) % 4
  when "R"
    (current_direction + 1) % 4
  end
end

class Position
  attr_accessor :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end

  def distance_from_origin
    x.abs + y.abs
  end

  def ==(another_position)
    self.x == another_position.x && self.y == another_position.y
  end

  # these to help with conversion to using this new object, could be
  # deleted later
  def [](coordinate)
    send(coordinate)
  end

  def []=(coordinate, new_value)
    send("#{coordinate}=", new_value)
  end
end

def next_position(current_position, direction, step_count)
  case direction
  when 0
    current_position[:y] += step_count
  when 1
    current_position[:x] += step_count
  when 2
    current_position[:y] -= step_count
  when 3
    current_position[:x] -= step_count
  end

  current_position
end

def find_destination(instructions)
  current_position = Position.new(0,0)
  current_direction = 0

  instructions.each do |instruction|
    turn_direction = instruction[0]
    current_direction = next_direction(current_direction, turn_direction)

    step_count = instruction[1..-1].to_i
    current_position = next_position(current_position, current_direction, step_count)
  end

  current_position
end

def calculate_distance_from_origin(position)
  position[:x].abs + position[:y].abs
end

def find_previously_visited(instructions)
  current_position = Position.new(0,0)
  current_direction = 0
  visited = []

  instructions.each do |instruction|
    turn_direction = instruction[0]
    current_direction = next_direction(current_direction, turn_direction)

    step_count = instruction[1..-1].to_i
    step_count.times do
      current_position = next_position(current_position, current_direction, 1)

      if visited.include?(current_position)
        return current_position
      else
        visited << current_position.dup
      end
    end
  end

  current_position
end

# input = %w(L4, L1, R4, R1, R1, L3, R5, L5, L2, L3, R2, R1, L4, R5, R4, L2, R1, R3, L5, R1, L3, L2, R5, L4, L5, R1, R2, L1, R5, L3, R2, R2, L1, R5, R2, L1, L1, R2, L1, R1, L2, L2, R4, R3, R2, L3, L188, L3, R2, R54, R1, R1, L2, L4, L3, L2, R3, L1, L1, R3, R5, L1, R5, L1, L1, R2, R4, R4, L5, L4, L1, R2, R4, R5, L2, L3, R5, L5, R1, R5, L2, R4, L2, L1, R4, R3, R4, L4, R3, L4, R78, R2, L3, R188, R2, R3, L2, R2, R3, R1, R5, R1, L1, L1, R4, R2, R1, R5, L1, R4, L4, R2, R5, L2, L5, R4, L3, L2, R1, R1, L5, L4, R1, L5, L1, L5, L1, L4, L3, L5, R4, R5, R2, L5, R5, R5, R4, R2, L1, L2, R3, R5, R5, R5, L2, L1, R4, R3, R1, L4, L2, L3, R2, L3, L5, L2, L2, L1, L2, R5, L2, L2, L3, L1, R1, L4, R2, L4, R3, R5, R3, R4, R1, R5, L3, L5, L5, L3, L2, L1, R3, L4, R3, R2, L1, R3, R1, L2, R4, L3, L3, L3, L1, L2)
# final_position = find_destination(input)
# puts calculate_distance_from_origin(final_position)

# first_previously_visited_position = find_previously_visited(input)
# puts calculate_distance_from_origin(first_previously_visited_position)
