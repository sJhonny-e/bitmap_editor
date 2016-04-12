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

	def color_range!(start_x, start_y, end_x, end_y, color)
		verify_in_bounds(start_x, start_y)
		verify_in_bounds(end_x, end_y)
		raise "start x (#{start_x}) must be smaller or equal to end x (#{end_x})" if (start_x > end_x)
		raise "start y (#{start_y}) must be smaller or equal to end y (#{end_y})" if (start_y > end_y)

		for i in ((start_x -1)..(end_x - 1)) do
			for j in ((start_y -1)..(end_y -1)) do
				@matrix[i][j] = color
			end
		end
		
		self #allow chaining	
	end

	private

	def verify_in_bounds(x, y, max_x = @width, max_y = @height) 
		raise "x and y must be numeric. received #{x} and #{y}" unless ( (x.is_a? Numeric) && (y.is_a? Numeric) )
		raise "(x,y) must be positive and inside the width and height of (#{max_x},#{max_y}). received (#{x},#{y})" if ( x > max_x || y > max_y || x < 1 || y < 1)
	end
end