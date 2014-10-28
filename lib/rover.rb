require "lib/dbg"
require "lib/err"
require "lib/instructions"
require "lib/point-movable"


class Rover

  @@count = 0

  attr_reader :move, :position

  def initialize(lines)
    @id = @@count
    @@count += 1
    read(lines)
  end

  def read(lines)
    Err.fatal "Invalid rover data: #{lines.join(':')}" if lines.size != 2
    @position = PointMovable.new(lines[0])
    @instructions = Instructions.new(lines[1])
  end

  def move(boundary)
    @instructions.value.each do |i| 
      @position.move_single(i) 
      unless boundary.in_bounds?(@position)
        puts "rover #{@id}: out of bounds"
        break
      end
    end
    Dbg.dbg "rover#{@id} moves: #{@position.print_moves}"
  end

  def to_s
    "rover#{@id}: #{@position}: #{@instructions}"
  end
  
end
