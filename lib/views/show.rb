class Show

  attr_accessor :tile_array

  def initialize(my_game)
    @tile_array = my_game.current_board.boardcase_array
  end


  def throw
    board_display_array = []

    tile_array.each do |boardcase|
      if boardcase.status = "player_one"
        board_display_array << "O"
      elsif boardcase.status = "player_two"
        boardcase << "X"
      else
        @board_display_array << " "
      end
    end


    puts "\|#{board_display_array[0]}\|#{board_display_array[1]}\|#{board_display_array[2]}\|"
    puts "\|#{board_display_array[3]}\|#{board_display_array[4]}\|#{board_display_array[5]}\|"
    puts "\|#{board_display_array[6]}\|#{board_display_array[7]}\|#{board_display_array[8]}\|"
  end
end
