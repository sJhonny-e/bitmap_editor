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
			for x in 1..5 do
				for y in 1..6 do
					expect(@image.bit_at(x, y)).to eql 'O'
				end
			end
		end
	end
end