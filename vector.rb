class Vector
  attr_accessor :x
  attr_accessor :y
  attr_accessor :z

  def initialize(x,y,z)
    @x = x.to_f
    @y = y.to_f
    @z = z.to_f
  end
end