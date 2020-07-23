class Board

  attr_accessor :boardcase_array

  @board_case_array = []

  def initialize

   @boardcase_array = [BoardCase.new("A1"), BoardCase.new("A2"), BoardCase.new("A3"), BoardCase.new("B1"), BoardCase.new("B2"), BoardCase.new("B3"), BoardCase.new("C1"), BoardCase.new("C2"), BoardCase.new("C3")]

  end

  #def call_board
  #  @boardcase_array
  #end

end