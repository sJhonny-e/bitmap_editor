require_relative './bitmap_image'
require_relative './bitmap_presenter'

class BitmapEditor

  def run
    @running = true
    puts 'type ? for help'
    while @running
      print '> '
      @input = gets.chomp.split
      command = @input[0]
      begin
        case command
          when '?'
            show_help
          when 'X'
            exit_console
          when 'I'
            init_image
          when 'C'
            verify_image
            @image.color_range!(1,1,@image.width, @image.height, nil)
          when 'L'
            color_bit
          when 'V'
            color_vertical
          when 'H'
            color_horizontal
          when 'S'
            verify_image
            puts @presenter.present_as_string
          else
            puts 'unrecognised command :('
        end
      rescue => e
        puts e.message
      end
    end
  end

  private
    
    def init_image
        width = @input[1].to_i
        height = @input[2].to_i

        @image = BitmapImage.new(width, height)
        @presenter = BitmapPresenter.new(@image)
    end

    def color_bit
      verify_image
      x = @input[1].to_i
      y = @input[2].to_i
      color = @input[3]
      
      @image.color_range!(x,y,x,y,color)
    end

    def color_vertical
      verify_image
      x = @input[1].to_i
      y = @input[2].to_i
      y2 = @input[3].to_i
      color = @input[4]

      @image.color_range!(x,y,x,y2,color)
    end

    def color_horizontal
      verify_image
      x = @input[1].to_i
      x2 = @input[2].to_i
      y = @input[3].to_i
      color = @input[4]

      @image.color_range!(x,y,x2,y,color)
    end

    def verify_image
      raise 'Image not initialized' unless @image
    end

    def exit_console
      puts 'goodbye!'
      @running = false
    end

    def show_help
      puts "? - Help
I M N - Create a new M x N image with all pixels coloured white (O).
C - Clears the table, setting all pixels to white (O).
L X Y C - Colours the pixel (X,Y) with colour C.
V X Y1 Y2 C - Draw a vertical segment of colour C in column X between rows Y1 and Y2 (inclusive).
H X1 X2 Y C - Draw a horizontal segment of colour C in row Y between columns X1 and X2 (inclusive).
S - Show the contents of the current image
X - Terminate the session"
    end
end
