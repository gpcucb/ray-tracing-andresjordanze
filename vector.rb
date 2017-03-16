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
    y = -((@x * vector.z) - (@z * vector.x))
    z = (@x * vector.y) - (@y * vector.x)
    return Vector.new(x, y, z)
  end

  # Producto escalar
  def scalar_product(vector)
    x = @x * vector.x
    y = @y * vector.y
    z = @z * vector.z
    return (x + y + z).to_f
  end

  # Producto vector por número
  def num_product(num)
    x = @x * num
    y = @y * num
    z = @z * num
    return Vector.new(x, y, z)
  end
end
