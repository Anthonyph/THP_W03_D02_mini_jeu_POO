require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'


def welcome_message
  puts "------------------------------------------------"
  puts "|Bienvenue dans 'ILS VEULENT TOUS MA POO' !      |"
  puts "|Le but du jeu est d'être le dernier survivant ! |"
  puts "|       Pose toi un coup et joue !!!!!!          |"
  puts "-------------------------------------------------"
end

def create_human_player
puts "Bonjour Humain, quel est ton prénom ?"
print "> "
username = gets.chomp 
user = HumanPlayer.new(username)
end


def new_player1
  player1 = Player.new("Josiane")
  return player1
end

def new_player2
  player2 = Player.new("José") 
  return player2
end

def enemies_array
player1 = new_player1
player2 = new_player2
enemies = []
enemies << player1
enemies << player2
return enemies
end

def fight
    player1 = new_player1
    player2 = new_player2
    user = create_human_player
    enemies = enemies_array
    while user.human_life_points >0 && (player1.life_points > 0 || player2.life_points >0)
    user.show_state
    puts ""
    puts "Quelle action veux-tu effectuer ?"
    puts " "
    puts "a - chercher une meilleure arme"
    puts "s - chercher à se soigner"
    puts " "
    puts "attaquer un joueur en vue : "
    puts "0 #{player1.show_state}"
    puts "1 #{player2.show_state}"
    
    puts "Quel est ton choix ? "
    print " > "
    choice = gets.chomp
        case
          when choice == "a"
          user.search_weapon
          when choice == "s"
          user.search_health_pack
          when choice == "0"
          user.attacks(player1) 
          when choice == "1"
          user.attacks(player2)  
        end #case
    puts " "
    puts " c'est le moment pour les ennemis de jouer"
    enemies.each do |x|
      if x.life_points > 0
      x.attacks(user)
      
      end #if
      end #each
  end #while
end 

binding.pry

def perform
  welcome_message
end
