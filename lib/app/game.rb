class Game

  attr_accessor :current_game, :current_board, :player_one, :player_two, :display

  def initialize(my_game)
    @current_board = Board.new
    ask_name
    @current_game = my_game
    @display = Show.new(@current_game)

    @display.throw
    while is_it_still_going?
      game_turn(@player_one)
      game_turn(@player_two)
    end

    end_of_the_game
  end

  #demande le nom des deux players
  def ask_name

    puts "Bienvenue sur TIC-TAC-TOE"
    puts "Veuillez écrire vos noms :"

    puts "Joueur 1 : "
    print "> "

    @player_one = Player.new(gets.chomp)

    puts "Joueur 2 : "
    print "> "

    @player_two = Player.new(gets.chomp)

  end

  #
  def game_turn(which_player)
    @display.throw
    puts "#{which_player.name} what do you want to do?"
    enter_input(which_player)

  end

  def enter_input(which_player)
    @gamer_choice = gets.chomp
      @current_board.boardcase_array.each do |boardcase|
        if boardcase.coords == @gamer_choice && boardcase.is_empty? == true
          which_player.name == @player_one.name ? boardcase.status = 'player_one' : boardcase.status = 'player_two'
        elsif boardcase.coords == @gamer_choice && boardcase.is_empty? == false
          puts 'you need to enter a valid coord'
          enter_input(which_player)
        end
      end
  end

  def is_it_still_going?
    arr = current_board.boardcase_array
    #player 1
    if arr[0].status == 'player_one' && arr[1].status == 'player_one' && arr[2].status == 'player_one'
      return false
    elsif arr[3].status == 'player_one' && arr[4].status == 'player_one' && arr[5].status == 'player_one'
      return false
    elsif arr[6].status == 'player_one' && arr[7].status == 'player_one' && arr[8].status == 'player_one'
      return false
    elsif arr[0].status == 'player_one' && arr[3].status == 'player_one' && arr[6].status == 'player_one'
      return false
    elsif arr[1].status == 'player_one' && arr[4].status == 'player_one' && arr[7].status == 'player_one'
      return false
    elsif arr[2].status == 'player_one' && arr[5].status == 'player_one' && arr[8].status == 'player_one'
      return alfse
    elsif arr[0].status == 'player_one' && arr[4].status == 'player_one' && arr[8].status == 'player_one'
      return false
    elsif arr[2].status == 'player_one' && arr[4].status == 'player_one' && arr[6].status == 'player_one'
      return false
      #player two
    elsif arr[0].status == 'player_two' && arr[1].status == 'player_two' && arr[2].status == 'player_two'
      return false
    elsif arr[3].status == 'player_two' && arr[4].status == 'player_two' && arr[5].status == 'player_two'
      return false
    elsif arr[6].status == 'player_two' && arr[7].status == 'player_two' && arr[8].status == 'player_two'
      return false
    elsif arr[0].status == 'player_two' && arr[3].status == 'player_two' && arr[6].status == 'player_two'
      return false
    elsif arr[1].status == 'player_two' && arr[4].status == 'player_two' && arr[7].status == 'player_two'
      return false
    elsif arr[2].status == 'player_two' && arr[5].status == 'player_two' && arr[8].status == 'player_two'
      return alfse
    elsif arr[0].status == 'player_two' && arr[4].status == 'player_two' && arr[8].status == 'player_two'
      return false
    elsif arr[2].status == 'player_two' && arr[4].status == 'player_two' && arr[6].status == 'player_two'
      return false
    elsif arr.any? { |boardcase| boardcase.status == nil }
      return true
    else
      return false
    end


  end

=begin
A1 [0] | A2 [1] | A3 [2]
B1 [3] | B2 [4] | B3 [5]
C1 [6] | C2 [7] | C3 [8]
=end

  def end_of_the_game
      puts 'end of the game'
  end

end
