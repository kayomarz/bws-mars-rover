class Err

  def self.fatal(msg)
    puts "Error: #{msg}"
    exit
  end

  def self.warn(msg)
    puts "Warning: #{msg}"
  end
end
