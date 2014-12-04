def check_player_cards(player)
  puts check_total(player)
end
 
def check_score(player)
  # binding.pry
    puts "check_score: "
    puts total = player[:hand].map { |card| card[:value] }.inject(:+)  
  case 
  when total > 21
    set_player_score(player,-100)
    player_done!(player)
    puts "BUST!"
  when total <= 21
    set_player_score(player,total)      
  end
end

def check_dealer_cards(dealer,deck)
  total = dealer[:hand].map { |card| card[:value] }.inject(:+)
  if total < 16
    hit(dealer,deck)
  elsif total > 21
    dealer[:score] = 0    
    dealer[:active] = 0    
  elsif total > 16
    dealer[:score] = total    
    dealer[:active] = 0
  end
end

def compare_totals(player,dealer)
  case
  when player[:score] == dealer[:score]
    puts "push"
    player_push(player)
  when player[:score] == 100
    player_blackjack(player)
    puts "BLACKJACK"    
  when player[:score] > dealer[:score]
    player_wins(player)
    puts "Your count: #{player[:score]}} Dealer count: #{dealer[:score]}} You win"
  when dealer[:score] > player[:score]
    puts "Your count: #{player[:score]} Dealer count: #{dealer[:score]} You lose"    
  end
end

def unresolved_players?
  
end

def showdown
end