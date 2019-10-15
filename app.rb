require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

def new_player1
  player1 = Player.new("Josiane")
  return player1
end
def new_player2
  player2 = Player.new("José") 
  return player2
end

def presentation #méthode de présentation
  player1 = new_player1
  player2 = new_player2
  puts "Voici l'état de chaque joueurs :"
  player1.show_state
  player2.show_state
end

def fight_begin #méthode fight
  player1 = new_player1
  player2 = new_player2
  puts " "
  puts "Passons à la phase d'attaque !"
  puts " "
    while player1.life_points > 0 && player2.life_points >0 #boucle du combat
    player1.attacks(player2)
      if player2.life_points <= 0 #sort de la boucle si le joueur est mort
      break
      end
    player2.attacks(player1)      
    if player1.life_points < 0 #sort de la boucle si le joueur est mort
    break
    end
    puts " "
    puts "#######################################################"
    puts " "
    puts "Voici l'état de nos braves guerriers : "
    puts " "
    player1.show_state
    player2.show_state
    puts " "
    end
    
end

def perform
new_player1
new_player2
presentation
fight_begin
end

perform

#binding.pry