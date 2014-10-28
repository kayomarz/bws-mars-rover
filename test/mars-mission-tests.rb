require "test/unit"

require "lib/mission"

class MarsMissionTests < Test::Unit::TestCase

  def setup
    @tests = [
              {
                "input" => "test/test-input-01.txt",
                "output" => ["1 3 N",
                             "5 1 E"]
              },
              {
                "input" => "test/test-input-02.txt",
                "output" => ["1 3 N", 
                             "5 1 E", 
                             "1 6 N"]
              }
             ]
  end

  def test_instructions
    @tests.each do |sample_run|
      mission = Mission.new
      mission.read(File::open(sample_run["input"]))
      end_positions = mission.start
      assert_equal(sample_run["output"], 
                   end_positions,
                   "Unexpected end position for sample run")
    end
  end

  # def teardown
  # end

end
