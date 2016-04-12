require_relative '../app/bitmap_presenter'
require_relative '../app/bitmap_image'

describe('BitmapPresenter') do
	before do
		@image_double = double(BitmapImage, :width => 2 , :height => 3)
		@presenter = BitmapPresenter.new(@image_double)
	end

	describe '#present_as_string' do
		before do 
			expect(@image_double).to receive(:bit_at).with(1,1).and_return('X')
			expect(@image_double).to receive(:bit_at).with(2,1).and_return('X')
			expect(@image_double).to receive(:bit_at).with(1,2).and_return('Y')
			expect(@image_double).to receive(:bit_at).with(2,2).and_return('Y')
			expect(@image_double).to receive(:bit_at).with(1,3).and_return('Z')
			expect(@image_double).to receive(:bit_at).with(2,3).and_return('W')
		end

		it 'returns a string with a line for each row' do
			expect(@presenter.present_as_string).to eql 'XX\nYY\nZW\n'
		end
	end
end