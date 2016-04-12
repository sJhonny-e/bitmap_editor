require 'spec_helper'
require_relative '../app/bitmap_image'

describe 'bitmap_image' do
	describe '#initialize' do
		it 'throws if input is not a number' do
			expect { BitmapImage.new(5, 'kuku') }.to raise_error('width and height must be numeric. received 5 and kuku')
		end

		it 'throws if input is too large' do
			expect { BitmapImage.new(250, 251) }.to raise_error('width and height must be between 1 and 250. received 250 and 251')
		end

		it 'throws if input is too small' do
			expect { BitmapImage.new(-1, 1) }.to raise_error('width and height must be between 1 and 250. received -1 and 1')
		end
	end
end