class Boundary

  def initialize(top_right)
    @top_right = top_right
  end

  def in_bounds?(pt)
    !(pt.x < 0 || pt.y < 0 || pt.x > @top_right.x || pt.y > @top_right.y)
  end

end
