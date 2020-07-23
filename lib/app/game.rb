class Game
  system("clear")
  attr_accessor :current_board, :player_one, :player_two, :display

  def initialize
    @score_player_one = 0
    @score_player_two = 0

    @current_board = Board.new
    ask_name
    system("clear")
    @display = Show.new(self)

    while is_it_still_going?
      game_turn(@player_one)
      @player_turn = @player_one
      break unless is_it_still_going?
      game_turn(@player_two)
      break unless is_it_still_going?
      @player_turn = @player_two
    end
    end_of_the_game
  end

  #demande le nom des deux players
  def ask_name

    puts ''
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
    puts ''
    puts "Bienvenue sur TIC-TAC-TOE"
    puts "Veuillez écrire vos noms :"

    puts "Joueur 1 : "
    puts "> #{@player_one.name}"
    puts "Joueur 2 : "
    puts "> #{@player_two.name}"
    puts ''
    @display.throw(self)
    puts ''
    puts "#{which_player.name} what do you want to do?"
    enter_input(which_player)
    system("clear")
  end

  def enter_input(which_player)
    player_choice = gets.chomp
    if @current_board.boardcase_array.any? {|boardcase| boardcase.coords == player_choice && boardcase.status == nil}
      @current_board.boardcase_array.each do |boardcase|
        if boardcase.coords == player_choice
          which_player.name == @player_one.name ? boardcase.status = 'player_one' : boardcase.status = 'player_two'
        end
      end
    else
      puts "ERROR"
      enter_input(which_player)
    end
  end

  def is_it_still_going?
    arr = @current_board.boardcase_array
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
      return false
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
    @display.throw(self)
    puts "THIS IS THE END OF THE GAME"
    puts ''
    if @current_board.boardcase_array.any? { |boardcase| boardcase.status == nil } == false
      puts 'I am afraid this a DRAW T_T'
    else
      puts "Wow! #{@player_turn.name} you did win this one"
      @player_turn == @player_one ? (@score_player_one += 1) : (@score_player_two += 1)
    end
    puts "#{@player_one.name} :#{@score_player_one} victories"
    puts "#{@player_two.name} :#{@score_player_two} victories"
    puts ''
    puts ''
    print "DO YOU WANT TO TRY AGAIN? Y/n"
    choice = gets.chomp
      exit unless choice == "Y"
  end

end
