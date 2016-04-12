require 'spec_helper'
require_relative '../app/bitmap_image'

describe 'bitmap_image' do
	describe '#initialize' do
		it 'throws if input is not a number' do
			expect { BitmapImage.new(5, 'kuku') }.to raise_error('x and y must be numeric. received 5 and kuku')
		end

		it 'throws if input is too large' do
			expect { BitmapImage.new(250, 251) }.to raise_error('(x,y) must be positive and inside the width and height of (250,250). received (250,251)')
		end

		it 'throws if input is too small' do
			expect { BitmapImage.new(-1, 1) }.to raise_error('(x,y) must be positive and inside the width and height of (250,250). received (-1,1)')
		end
	end
	describe '#bit_at' do
		before do
			@image = BitmapImage.new(5, 6)
		end

		it 'throws if input is not a number' do
			expect { @image.bit_at(5, 'kuku') }.to raise_error('x and y must be numeric. received 5 and kuku')
		end

		it 'throws if input is out of range' do
			expect { @image.bit_at(5, 7) }.to raise_error('(x,y) must be positive and inside the width and height of (5,6). received (5,7)')
		end

		it 'is initially all Os' do
			expect_default
		end
	end

	describe '#color_range!' do
		before do
			@image = BitmapImage.new(5, 6)
		end

		it 'throws if start coordinates are out of range' do
			expect {@image.color_range!(5,7,5,7, 'B')}.to raise_error('(x,y) must be positive and inside the width and height of (5,6). received (5,7)')
		end

		it 'throws if end coordinates are out of range' do
			expect {@image.color_range!(1,3,6,5, 'B')}.to raise_error('(x,y) must be positive and inside the width and height of (5,6). received (6,5)')
		end

		it 'throws if x end coordinates are smaller than start x coordinates' do
			expect {@image.color_range!(2,3,1,4, 'B')}.to raise_error('start x (2) must be smaller or equal to end x (1)')
		end

		it 'throws if y end coordinates are smaller than start y coordinates' do
			expect {@image.color_range!(2,3,4,1, 'B')}.to raise_error('start y (3) must be smaller or equal to end y (1)')
		end

		it 'colors a single cell' do
			@image.color_range!(2,3,2,3, 'kuku')
			expect(@image.bit_at(2,3)).to eql 'kuku'
			expect_default(2,3,2,3)
		end

	end

	def expect_default(except_start_x = -1, except_start_y = -1, except_end_x = -1, except_end_y = -1)
		for x in 1..5 do
			for y in 1..6 do
				expect(@image.bit_at(x, y)).to eql 'O' unless ( x.between?(except_start_x, except_end_x)  && y.between?(except_start_y, except_end_y) )
			end
		end
	end
end