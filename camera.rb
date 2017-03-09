class Camera
	attr_accessor :e,:center,:up

	def initialize(e,center,up)
		@e = e#vector
		@center = center#vector
		@up = up#vector
	end

  def wVector
    d = @e.minus(@center)#why?
    x = d.x/d.mod
    y = d.y/d.mod
    z = d.z/d.mod
    return Vector.new(x, y, z)
  end

  def uVector(wVector)
    prod = @up.prodVec(wVector)
    x = @prod.x/@prod.mod
    y = @prod.y/@prod.mod
    z = @prod.z/@prod.mod
    return Vector.new(x, y, z)
  end

  def vVector(wVector, uVector)
    return wVector.prodVec(uVector)
  end

  def calcular_distancia(i, j, nx, ny)
    #homework
  end
end