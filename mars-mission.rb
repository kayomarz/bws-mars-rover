require "lib/dbg"
require 'lib/mission'

mission = Mission.new
mission.read(STDIN)
end_positions = mission.start

puts end_positions.join("\n")
#puts Dbg.print
