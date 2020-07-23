class BoardCase

  attr_accessor :coords, :status

  def initialize (coords)
    @coords = coords
    @status = nil
  end

  #demande si la case est vide ou pas
  def is_empty?
    if @status == nil
      return true
    else
      return false
    end
  end

  def board_case_selected
    #if player 1 => "X"

    # return @status = "X"
    #if player 2 => "O"
    # return @status = "O"
  end


end
