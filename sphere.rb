require_relative 'vector.rb'
require_relative 'intersection.rb'

class Sphere
  attr_accessor :position, :radius, :material

  def initialize(position, radius, material)
    @position = position #center(c)
    @radius = radius.to_f
    @material = material
  end

  def intersection?(ray, t)
    e = ray.position
    d = ray.direction

    e_c = e.minus(@position)
    dd = d.num_product(2)

    a = d.scalar_product(d)
    b = dd.scalar_product(e_c)
    c = e_c.scalar_product(e_c) - @radius ** 2
    #puts "(A: #{a} , B: #{b} , C: #{c})"
   
    discriminant = b**2-(4*a*c)

    return Intersection.unsuccessful if (discriminant < 0.0)

    t0 = ((b * -1) - Math.sqrt(discriminant))/(2 * a)
    t1 = ((b * -1) + Math.sqrt(discriminant))/(2 * a)

    success = false

    if ((t0 > 0.0) && (t0 < t))
      t = t0
      success = true
    end
    if ((t1 > 0.0) && (t1 < t))
      t = t1
      success = true
    end

    return Intersection.new(t, success)
  end

  def normal(p)
    c = @position#center
    p_c = p.minus(c)#why? Ans: Book pag 77
    return Vector.new(p_c.x/@radius,p_c.y/@radius,p_c.z/@radius)
  end
end
