require 'pry'

require_relative 'player'

class Game
  attr_accessor :human_player, :enemies
  def initialize (name)
    @enemies = []
    @human_player = HumanPlayer.new(name)
    for i in 1..4 do
      player = Player.new("mechants_Bots_#{i}")
      @enemies << player
    end
  end

  def kill_player (player)
    @enemies.delete(player)
  end

  def is_stil_ongoing?
    if @human_player.life_points > 0 && !@enemies.empty?
      return true
    else
      return false
    end
  end

  def show_player
    puts @human_player.show_state
    puts "Il reste #{@enemies.size} méchants_bots dans le game !"
  end
  
  def menu
    puts"quelle action veux tu effectuer?"
    puts"a - chercher une meilleure arme"
    puts"s - chercher à se soigner "
    puts ""
    puts"attaquer un joueur en vue :"
    @enemies.each_with_index { |player , i| 
      puts "#{i} - #{player.show_state}"
      }
  end
  
  def menu_choice (choice)
    case choice
      when "a"
        @human_player.search_weapon
      when "s"
        @human_player.search_health_pack
      when 0..4
        @human_player.attacks(@enemies[choice])
        if @enemies[choice].life_points <= 0       # quand un ennemis n'a plus de points de vie, on lance
           kill_player(@enemies[choice])           # kill_player pour le supprimer de l'array @enemies
        end
    end
  end
  
  def enemies_attack
    puts "les méchants_bots attaquent !"
    @enemies.each {|ennemie| ennemie.attacks(@human_player)}
  end
  
  def end
    puts ""
    puts"la partie est finie "
    if @human_player.life_points>0
      puts"Félicitations !!!!!!!!!! Tu as gagné !!!!!!!"
    else puts "Dommage, tu as perdu ! Retente ;) !!!"
    end
  end

  binding.pry
end
