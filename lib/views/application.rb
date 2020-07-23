

class Application
  attr_accessor :game

  def initialize
    loop do
      @game = Game.new
    end
  end
end
