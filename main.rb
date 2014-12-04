require 'pry'
require_relative 'cards'
require_relative 'player'
require_relative 'checks'

player = get_player

dealer = get_player(true)
deck = shuffle_decks(set_of_cards)

def round(player,deck)
  begin    
    choice = get_player_choice
    if choice == 'h'
      hit(player,deck)      
      player_done?(player)
      puts check_score(player)      
    elsif choice == 's'                  
      player_done!(player)
      player_done?(player)      
    else
      puts "bad choice"
      get_player_choice
    end 
  end until player_done?(player)  
end

begin
  reset_player(player)
  reset_player(dealer)
  puts "Your cash #{player[:cash]}"
  puts "Your bet?"
  set_player_bet(player,gets.chomp)  
  deal_round(player,dealer,deck)
  
  puts check_score(player)

  round(player,deck)
  begin 

    check_dealer_cards(dealer,deck)    
  end until player_done?(dealer)
  compare_totals(player,dealer)


  


end until false