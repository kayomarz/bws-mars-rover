require 'lib/err'

class Point

  attr_reader :x, :y

  def initialize(str)
    read(str)
  end

  def read(str)
    Err.fatal "Invalid line for a point: #{str}" if str.match(/[^ 0-9]/)
    cords = str.split(' ')
    @x = cords[0].to_i || 0
    @y = cords[1].to_i || 0
    Err.warn "insufficient data for point: #{str}" if cords.length < 2
    Err.warn "Excess data for point: #{str}" if cords.length > 2
  end

  def to_s
    "#{@x} #{@y}"
  end

end
