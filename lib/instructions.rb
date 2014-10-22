require "lib/err"

class Instructions

  attr_reader :value

  def initialize(str)
    read(str)
  end

  def read(str)
    str.strip!
    Err.fatal "Invalid instruction in: #{str}" if str.match(/[^LRM]/)
    @value = str.split("")
  end

  def to_s
    "#{@value.join()}"
  end

end
