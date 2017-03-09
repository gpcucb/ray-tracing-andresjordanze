require_relative 'vector.rb'

class Camera
  attr_accessor :e, :center, :up

  def initialize(e,center,up)
    @e = e#vector
    @center = center#vector
    @up = up#vector
  end

  # Cálculo del vector w
  def w_vector
    d = @e.minus(@center)#why?
    x = d.x/d.mod
    y = d.y/d.mod
    z = d.z/d.mod
    return Vector.new(x, y, z)
  end

  # Cálculo del vector w
  def u_vector(w_vector)
    prod = @up.vector_product(w_vector)
    x = prod.x/prod.mod
    y = prod.y/prod.mod
    z = prod.z/prod.mod
    return Vector.new(x, y, z)
  end

  # Cálculo del vector w
  def v_vector(w_vector, u_vector)
    return w_vector.vector_product(u_vector)
  end

  # Cálculo de la dirección del rayo
  def ray_direction(i, j, nx, ny)
    #homework
  end
end
