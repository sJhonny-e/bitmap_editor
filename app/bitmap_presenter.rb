class BitmapPresenter
	def initialize(bitmap_image)
		@image = bitmap_image
	end

	def present_as_string
		str = ''
		for i in (1..@image.height) do
			for j in (1..@image.width) do
				str += @image.bit_at(j, i)
			end
			str += '\n'
		end
		str
	end
end