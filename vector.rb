class Vector
  attr_accessor :x
  attr_accessor :y
  attr_accessor :z

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
  def vectorProduct(vector)
    i = (@y * vector.z) - (@z * vector.y)
    j = (@z * vector.x) - (@x * vector.z)
    k = (@x * vector.y) - (@y * vector.x)
    return Vector.new(i, j, k)
  end

  # Producto escalar
  def scalarProduct(vector)
    i = @x * vector.x
    j = @y * vector.y
    k = @z * vector.z
    return (i + j + k).to_f
  end
end
