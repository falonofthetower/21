def get_player(computer=nil)
  if computer
    computer = { name: 'CPU', active: 1, hand: []}
  else
    player = {}  
    puts "You must have a name to play:"
    player[:name] = gets.chomp
    puts "How much did you bring?"
    player[:cash] = gets.chomp.to_i

    player[:active] = 1
    player[:hand] = []
    player[:bet] = 0
    player[:score] = 0
    player
  end
end

def reset_player(player)
  player[:active] = 1
  player[:hand] = []
  player[:bet] = 0
  player[:score] = 0
end

def get_player_choice  
  puts "hit or stand? (h/s)"
  gets.chomp
end

def set_player_bet(player,bet)
  player[:bet] = bet.to_i
  player[:cash] = player[:cash] - player[:bet]
end

def set_player_cash(player,cash)
  players[player][:cash] += cash
end

def reset_player_hand
  player[:hand] = []
  #refresh
end

def hit(player,deck)
  card = deal_card(deck)
  player[:hand] << card
  puts card
end

def reset_player_active(player)
  player[:active] = 1
end

def player_done!(player)
  #puts check_total(player)
  player[:active] = 0
  #player[:hand] = []
end

def player_done?(player)  
  player[:active] == 0         
end

def set_player_score(player,score)
  player[:score] = score  
end

def player_wins(player)
  player[:cash] = player[:cash] += player[:bet]*2
end

def player_blackjack(player)
  player[:cash] = player[:cash] += player[:bet]*2.5
end

def player_push(player)
  player[:cash] = player[:cash] + player[:bet]
end