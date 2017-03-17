require_relative 'vector.rb'

class Camera
  attr_accessor :e, :center, :up, :fov, :df

  def initialize(e,center,up,fov,df)
    @e = e#vector
    @center = center#vector
    @up = up#vector
    @fov = ((fov * Math::PI)/180).to_f#why? convert degrees to radians
    @df = df.to_f#scalar
  end

  # Cálculo del vector w
  def w_vector
    d = @center.minus(@e)#why? Ans: Book page 73
    x = d.x/d.mod
    y = d.y/d.mod
    z = d.z/d.mod
    return Vector.new(-x, -y, -z)#why -w? Ans: Book pag 74
  end

  # Cálculo del vector u
  def u_vector()
    prod = @up.vector_product(w_vector)
    x = prod.x/prod.mod
    y = prod.y/prod.mod
    z = prod.z/prod.mod
    return Vector.new(x, y, z)
  end

  # Cálculo del vector v
  def v_vector()
    return w_vector.vector_product(u_vector)
  end

  # Cálculo de la dirección del rayo
  def ray_direction(i, j, nx, ny)
    t = @df * Math::tan(@fov/2).to_f#why? Ans: Book page 157
    b = -t
    r = (((nx * t) / ny)).to_f#why? Ans: Book page 157
    l = -r

    u = l + ((r - l) * (i + 0.5))/nx#why? Ans: Book page 75
    v = b + ((t - b) * (j + 0.5))/ny#why? Ans: Book page 75

    dw = w_vector.num_product(-@df)
    uu = u_vector.num_product(u)
    vv = v_vector.num_product(v)

    return (dw.plus(uu)).plus(vv)#why? Ans: Book page 76
  end
end
