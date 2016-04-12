class BitmapImage
	
	DEFAULT_COLOR = 'O'

	def initialize(width, height)
		raise "width and height must be numeric. received #{width} and #{height}" unless ( (width.is_a? Numeric) && (height.is_a? Numeric) )
		raise "width and height must be between 1 and 250. received #{width} and #{height}" if (width < 1 || height < 1 || width > 250 || height > 250)
		@width = width
		@height = height
		@matrix = Array.new(@width) { Array.new(@height, DEFAULT_COLOR) }
	end

	def bit_at(x, y)
		raise "x and y must be numeric. received #{x} and #{y}" unless ( (x.is_a? Numeric) && (y.is_a? Numeric) )
		raise "(x,y) must be inside the current width and height of (#{@width},#{@height}). received (#{x},#{y})" if ( x > @width || y > @height || x < 1 || y < 1)
		@matrix[x -1][y -1]
	end
end