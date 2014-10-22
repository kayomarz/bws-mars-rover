require "lib/dbg"
require "lib/boundary"
require "lib/err"
require "lib/point"
require "lib/rover"

class Mission

  attr_reader :read, :rovers, :start

  def read(input)
    Dbg.dbg "reading input..."
    lines = input.read.split("\n").select {|line| line.strip.length != 0}
    
    # Spec: First line => top right corner
    top_right = Point.new(lines.shift)
    Dbg.dbg "top_right: #{top_right}"
    @boundary = Boundary.new(top_right)

    @rovers = []
    # Spec: Two lines per rover (1 for position, other for instructions)
    Err.fatal "Instructions missing for last rover" if (lines.size % 2 != 0)
    while lines.size > 0 do 
      rover = Rover.new(lines.shift(2))
      if @boundary.in_bounds?(rover.position)
        @rovers << rover
      else
        puts "Initial position out of bound: #{rover.position}"
      end
    end

    @rovers.each {|r| Dbg.dbg r.to_s}
  end

  def start
    @rovers.each do |r| 
      r.move(@boundary)
    end

    @rovers.each do |r| 
      puts r.position.to_s
    end

    puts "\nDebug output:"
    puts Dbg.print

  end

end
