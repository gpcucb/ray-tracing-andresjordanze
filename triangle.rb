require_relative 'vector.rb'
require_relative 'intersection.rb'

class Triangle

  attr_accessor :a,:b,:c, :material
  def initialize(a, b, c, material)
    @a = a#vector
    @b = b#vector
    @c = c#vector
    @material = material
  end

  def determinant(vec_1,vec_2,vec_3)
    a, b, c = vec_1.x, vec_1.y, vec_1.z
    d, e, f = vec_2.x, vec_2.y, vec_2.z
    g, h, i = vec_3.x, vec_3.y, vec_3.z
    return ((a*e*i) + (b*f*g) + (c*d*h) - (c*e*g) - (b*d*i) - (a*f*h))
  end

  def intersection?(ray, t)
    e = ray.position
    d = ray.direction

    xa_xb, xa_xc, xa_xe = @a.x - @b.x, @a.x - @c.x, @a.x - e.x
    ya_yb, ya_yc, ya_ye = @a.y - @b.y, @a.y - @c.y, @a.y - e.y
    za_zb, za_zc, za_ze = @a.z - @b.z, @a.z - @c.z, @a.z - e.z
    xd, yd, zd = d.x, d.y, d.z


    m = determinant(Vector.new(xa_xb, xa_xc, xd), Vector.new(ya_yb, ya_yc, yd), Vector.new(za_zb, za_zc, zd))
    beta = determinant(Vector.new(xa_xe, xa_xc, xd), Vector.new(ya_ye, ya_yc, yd), Vector.new(za_ze, za_zc, zd)) / m
    gama = determinant(Vector.new(xa_xb, xa_xe, xd), Vector.new(ya_yb, ya_ye, yd), Vector.new(za_zb, za_ze, zd)) / m
    t = determinant(Vector.new(xa_xb, xa_xc, xa_xe), Vector.new(ya_yb, ya_yc, ya_ye), Vector.new(za_zb, za_zc, za_ze)) / m

    if ((beta > 0) && (gama > 0) && ((beta + gama) < 1))
      success = true
      return Intersection.new(t, success)
    else
      return Intersection.unsuccessful
    end
  end

  def isLeft?(n)
    m = n.mod()
    return n.x/m < 0 && n.y/m < 0 && n.z/m < 0
  end

  def normal(p)
    b_a = @b.minus(@a)
    c_a = @c.minus(@a)

    normal = b_a.vector_product(c_a)
    if isLeft?(normal)
      normal = normal.num_product(-1)
    end
    return normal
  end
end
