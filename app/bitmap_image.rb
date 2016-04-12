class BitmapImage
	
	DEFAULT_COLOR = 'O'

	def initialize(width, height)
		verify_in_bounds(width, height, 250, 250)
		@width = width
		@height = height
		@matrix = Array.new(@width) { Array.new(@height, DEFAULT_COLOR) }
	end

	def bit_at(x, y)
		verify_in_bounds(x,y)
		@matrix[x -1][y -1]
	end


	private

	def verify_in_bounds(x, y, max_x = @width, max_y = @height) 
		raise "x and y must be numeric. received #{x} and #{y}" unless ( (x.is_a? Numeric) && (y.is_a? Numeric) )
		raise "(x,y) must be positive and inside the width and height of (#{max_x},#{max_y}). received (#{x},#{y})" if ( x > max_x || y > max_y || x < 1 || y < 1)
	end
end