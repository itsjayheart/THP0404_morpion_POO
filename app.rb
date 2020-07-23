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
require 'application'

Application.new
