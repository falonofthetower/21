def get_player(computer=nil)
  if computer
    computer = { name: 'CPU', active: 1}
  else
    player = {}  
    puts "You must have a name to play:"
    player[:name] = gets.chomp
    puts "How much did you bring?"
    player[:cash] = gets.chomp
    player[:active] = 1
    player
  end
end

def set_player_bet(player,bet)
  player[:bet] = bet
end

def set_player_cash(player,cash)
  players[player][:cash] += cash
end

def reset_player_hand
  player[:hand] = []
  refresh
end

def hit(player,deck)
  player[:hand] << deal_card(deck)
  refresh
end

def player_done(player)
  player[:active] = 0
end

def set_player_score(player,score)
  player[:score] = score
  refresh
end 