class Direction

  MAP = ["N", "E", "S", "W"]

  def initialize(dir)
    @value = Direction::MAP.index(dir)
    raise "Unexpected direction" if (@value == nil)
  end

  def rotate_left
    # puts "ROT_L1 #{@value}"
    @value -= 1
    @value = (Direction::MAP.size - 1) if @value < 0
    # puts "ROT_L2 #{@value}"
  end

  def rotate_right
    # puts "ROT_R1 #{@value}"
    @value += 1
    @value = @value % Direction::MAP.size
    # puts "ROT_R1 #{@value}"
  end

  def to_s
    Direction::MAP[@value]
  end
end
