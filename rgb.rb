class Rgb
  attr_accessor :r
	attr_accessor :g
	attr_accessor :b

	def initialize(r,g,b)
		@r = r.to_f
		@g = g.to_f
		@b = b.to_f
	end
end
