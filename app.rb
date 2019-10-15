require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

def new_player
player1 = Player.new("Noémie")
player2 = Player.new("Anthony")
end

def presentation
puts "Avant de commencer, voici l'état de chaque joueur :"
player1.show_state
player2.show_state
end

def perform 
new_player
presentation
end

binding.pry