require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

binding.pry

def welcome_message
  puts "------------------------------------------------"
  puts "|Bienvenue dans 'ILS VEULENT TOUS MA POO' !      |"
  puts "|Le but du jeu est d'être le dernier survivant ! |"
  puts "|       Pose toi un coup et joue !!!!!!          |"
  puts "-------------------------------------------------"
end

def create_human_player


end

def perform
  welcome_message
end

binding.pry