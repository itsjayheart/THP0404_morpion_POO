

while turn_done?
  if @current_board.boardcase_array.any? { |boardcase| boardcase.coords == @gamer_choice } == false
    puts 'choose a valid coordonate'
    next
  elsif boardcase.coords == @gamer_choice && boardcase.is_empty? == false
    puts "Choose a boardcase that is available"
    next
  else
    @current_board.boardcase_array.each do |boardcase|
      if boardcase.coords == @gamer_choice && boardcase.is_empty? == true
        which_player.name == @player_one.name ? boardcase.status = 'player_one' : boardcase.status = 'player_two'
      end
    end
  end
end


  def turn_done?
