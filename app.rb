require 'pry'
require 'bundler' #eviter de require les gems
Bundler.require #eviter de require les gems
$:.unshift File.expand_path("./../lib/app", __FILE__)
$:.unshift File.expand_path("./../lib/views", __FILE__)

require 'game'
require 'boardcase'
require 'board'
require 'player'
require 'show'



my_game = Game.new(my_game)

binding.pry
