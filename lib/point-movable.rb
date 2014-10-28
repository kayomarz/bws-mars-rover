require "lib/err"
require "lib/direction"

class PointMovable

  MOVEDIR = {
    "N" => :move_up,
    "E" => :move_right,
    "S" => :move_down,
    "W" => :move_left
  }

  attr_reader :x, :y

  def initialize(str)
    read(str)
    @_debug_positions = [self.to_s]
  end

  def print_moves
    @_debug_positions.join(", ")
  end

  def cord_to_i(str)
    Err.fatal "Invalid pos: #{str}" if str.match(/[^0-9]/)
    str.to_i
  end

  def read(str)
    cords = str.split(" ")
    @x = cord_to_i(cords[0])
    @y = cord_to_i(cords[1])
    Err.fatal "Invalid direction in: #{str}" if cords[2].match(/[^NSEW]/)
    @direction = Direction.new(cords[2])
  end

  def move_single(instruction)
    self.send(instruction.to_sym)
    @_debug_positions << self.to_s
  end

  def to_s
    "#{@x} #{@y} #{@direction}"
  end

  def L
    @direction.rotate_left
  end

  def R
    @direction.rotate_right
  end

  def M
    self.send(PointMovable::MOVEDIR[@direction.to_s])
  end

  def move_left
    @x -= 1
  end

  def move_right
    @x += 1
  end

  def move_up
    @y += 1
  end

  def move_down
    @y -= 1
  end

end
