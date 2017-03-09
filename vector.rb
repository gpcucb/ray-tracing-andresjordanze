class Vector
  attr_accessor :x, :y, :z

  def initialize(x,y,z)
    @x = x.to_f
    @y = y.to_f
    @z = z.to_f
  end

  def show()
    puts "(#{@x} , #{@y} , #{@z})"
  end

  # Suma de vectores
  def plus(vector)
    return Vector.new(@x + vector.x, @y + vector.y, @z + vector.z);
  end

  # Resta de vectores
  def minus(vector)
    return Vector.new(@x - vector.x, @y - vector.y, @z - vector.z);
  end

  # Módulo de un vector
  def mod()
    return Math.sqrt(((@x**2) + (@y**2) + (@z**2)))
  end

  # Producto vectorial
  def vector_product(vector)
    x = (@y * vector.z) - (@z * vector.y)
    y = (@z * vector.x) - (@x * vector.z)
    z = (@x * vector.y) - (@y * vector.x)
    return Vector.new(x, y, z)
  end

  # Producto escalar
  def scalar_product(vector)
    i = @x * vector.x
    j = @y * vector.y
    k = @z * vector.z
    return (i + j + k).to_f
  end
end
