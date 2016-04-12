class BitmapImage
	
	def initialize(width, height)
		raise "width and height must be numeric. received #{width} and #{height}" unless ( (width.is_a? Numeric) && (height.is_a? Numeric) )
		raise "width and height must be between 1 and 250. received #{width} and #{height}" if (width < 1 || height < 1 || width > 250 || height > 250)
		@width = width
		@height = height
	end
end