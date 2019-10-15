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

def fight
  player1 = Player.new("Josiane")
  player2 = Player.new("José") 
  enemies = []
  enemies << player1
  enemies << player2
  user = create_human_player  
    while user.human_life_points >0 && (player1.life_points > 0 || player2.life_points >0)
    puts ""
    user.show_state
    puts ""
    puts "Quelle action veux-tu effectuer ?"
    puts " "
    puts "a - chercher une meilleure arme"
    puts "s - chercher à se soigner"
    puts " "
    puts "attaquer un joueur en vue : "
    puts " "
    print "0 - "
    print player1.show_state
    print "1 - "
    print player2.show_state
    puts ""
    
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
          else 
            puts "je ne comprends pas votre requête"
            puts "je relance le jeu"
            break
        end #case
    enemies.each do |x|
        if x.life_points > 0
          puts " "
          puts "C'est au tour de #{x.name} de jouer"
          puts " "
          x.attacks(user)
          puts x.name
        end #if
      end #each    
      #p enemies
  end #while
end 

binding.pry

def perform
  welcome_message
end
