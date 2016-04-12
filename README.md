# bitmap_editor
Simple ruby program to edit a map of bits via console

##Program input

The input consists of a string containing a sequence of commands, where a command is represented by a single capital letter at the beginning of the line. Parameters of the command are separated by white spaces and they follow the command character.

Pixel co-ordinates are a pair of integers: a column number between 1 and 250, and a row number between 1 and 250. Bitmaps starts at coordinates 1,1. Colours are specified by capital letters.
Commands

There are 8 supported commands:

    I M N - Create a new M x N image with all pixels coloured white (O).
    C - Clears the table, setting all pixels to white (O).
    L X Y C - Colours the pixel (X,Y) with colour C.
    V X Y1 Y2 C - Draw a vertical segment of colour C in column X between rows Y1 and Y2 (inclusive).
    H X1 X2 Y C - Draw a horizontal segment of colour C in row Y between columns X1 and X2 (inclusive).
    S - Show the contents of the current image
    ? - Displays help text
    X - Terminate the session

###Example

In the example below, > represents input
```
> I 5 6
> L 2 3 A
> S
OOOOO
OOOOO
OAOOO
OOOOO
OOOOO
OOOOO
> V 2 3 6 W
> H 3 5 2 Z
> S
OOOOO
OOZZZ
OWOOO
OWOOO
OWOOO
OWOOO
```

##Implementation
The bitmap image is implemented as a class, exposing a very simple interface of getter (`bit_at(x,y)`),  
and a single method for coloring a range (`color_range!`).  

CLI commands are read by the `bitmap_editor` class, which parses the input and invokes the appropriate methods on the `bitmap_image` class.  

Rendering of the bitmap is done by a `bitmap_presenter` class, which, currently, just prints out the bitmap as rows of text.  

##What can be improved
Some things were not done due to timing constraints;  
Here's what I would've done given some more free time:  
* Tests should be added to the `bitmap_editor` class
* Verifying that the input is an integer should be the responsibility of `bitmap_editor` rather than the `bitmap_image`, since it's the one handling user input
* Specific exception types should be thrown by `bitmap_image`, to enable better error handling
* It might be convenient to add syntactic sugar methods to `bitmap_image` for common cases, such as `color_bit`, `color_vertical` etc..
