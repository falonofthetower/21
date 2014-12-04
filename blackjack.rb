require 'pry'

# Helper methods

def player_broke?(player)
  player[:chips] < 0
end

def create_deck
  suits = ['H', 'D', 'S', 'C']
  face = ['2','3','4','5','6','7','8','9','T','J','Q','K','A']
  deck = suits.product(face)
  deck.shuffle!
end

def calculate_total(hand)
  total = 0
  aces = 0
  count = hand.map { |each| each[1] }
  count.each do |value|
    if value == 'A'
      total += 11
      aces += 1
    elsif value.to_i == 0
      total += 10    
    else
      total += value.to_i      
    end

    while total > 21 && aces > 0
      total += -10
      aces += -1
    end    
  end
  total
end

def bust?(player)
  calculate_total(player[:hand]) > 21
end

def blackjack?(player)
   calculate_total(player[:hand]) == 21 && player[:hand].count == 2
end

def check_for_blackjacks?(player,dealer)
  blackjack?(player) ? player[:blackjack] = true : false
  blackjack?(dealer) ? dealer[:blackjack] = true : false
  if (player[:blackjack] == true) || (dealer[:blackjack] == true)
    true
  else
    false
  end
end

def deck_low?(deck)
  deck.count < 20  
end

def deal_card(player,deck)  
  player[:hand] << deck.pop
end

# Display methods

def display_hand(player)  
  top_line = ""
  denomination_line = ""
  suit_line = ""
  side_line = ""
  bottom_line = ""
  player[:hand].each do |card|
     top_line <<             " ---  "
     denomination_line <<    "| #{card[1]} | "    
     suit_line <<            "| #{card[0]} | "
     side_line <<            "|   | "
     bottom_line <<          " ---  "
  end
  puts top_line
  puts denomination_line
  puts suit_line
  puts side_line
  puts bottom_line
end

def clear_screen
  print "\e[2J\e[f"
end 

def display_table(player,dealer)
  edge = '***********************************************************************'  
  system("clear")    
  puts edge
  display_hand(dealer)
  puts ""
  puts ""
  puts ""
  puts ""
  display_hand(player)
  puts edge
  sleep 0.5
end

def ask_for_chips
  begin
    puts "How many chips do you want?"
    chips = gets.chomp.to_i
    if chips == 0
      puts "You must have chips to enter!"
    else
      valid = true
    end
  end until valid
  chips
end

def ask_for_name
  begin
    puts "Your name?"
    name = gets.chomp.to_s
    if name == ""
      puts "No Name NO ENTRY!"
    else
      valid = true
    end
  end until valid
  name
end

# Play flow functions

def introduction(player)  
  
  puts "Welcome to BlackJack"

  player[:name] = ask_for_name

  player[:chips] = ask_for_chips
end

def start_round(player,dealer,deck)  
  deck = create_deck.shuffle! if deck_low?(deck)
  player[:bet] = 0
  player[:hand] = []
  dealer[:hand] = []  
  player[:bust] = false
  dealer[:bust] = false
  player[:blackjack] = false
  dealer[:blackjack] = false


  puts "#{player[:name]} Chips: #{player[:chips]}"
  puts "Place your bet!"  

  player[:bet] = gets.chomp.to_i
  player[:chips] -= player[:bet]  
  
  display_table(player,dealer) 
  deal_card(player,deck)
  display_table(player,dealer)  
  deal_card(dealer,deck)
  display_table(player,dealer)  
  deal_card(player,deck)
  display_table(player,dealer)  
  deal_card(dealer,deck)
  display_table(player,dealer)
end

def play_player(player,dealer,deck)
  begin

    blackjack = check_for_blackjacks?(player,dealer)
    unless dealer[:blackjack]
      player_total = calculate_total(player[:hand])
      dealer_total = calculate_total(dealer[:hand])
      
      puts "Your total is: #{player_total}, dealer has: #{dealer_total}"
      puts "Hit or Stay? h/s"
      hit_or_stay = gets.chomp
      if hit_or_stay == 'h'    
        deal_card(player,deck)
        display_table(player,dealer)
      elsif hit_or_stay != 's'
        puts "pick (h) or (s)"    
      end
      player_total = calculate_total(player[:hand])
      player[:bust] = bust?(player)  
    end
  end until (hit_or_stay == 's') || (player[:bust] == true) || blackjack
end

def play_dealer(player,dealer,deck)
  unless player[:bust] || player[:blackjack] || dealer[:blackjack]
    dealer_total = calculate_total(dealer[:hand])
    while dealer_total < 17      
      deal_card(dealer,deck)
      display_table(player,dealer)      
      dealer[:bust] = bust?(dealer)    
      dealer_total = calculate_total(dealer[:hand])
    end
  end
end

def determine_winner(player,dealer)
  dealer_total = calculate_total(dealer[:hand])
  player_total = calculate_total(player[:hand])
  puts "My total: #{player_total}"
  puts "Dealer total: #{dealer_total}"    
  if player_total > 21
    puts "#{player[:name]} busts!"
  elsif (blackjack?(player) && blackjack?(dealer)) || player_total == dealer_total
    player[:chips] += player[:bet]
    puts "Push"
  elsif blackjack?(dealer)
    puts "Dealer BlackJack!"
  elsif player_total > 21
    puts "#{player[:name]} busts!"
  elsif blackjack?(player)
    player[:chips] += player[:bet] * 2.5
    puts "BlackJack!"    
  elsif player_total > dealer_total
    player[:chips] += player[:bet] * 2
    puts "#{player[:name]} Wins!"
  elsif dealer_total > 21
    player[:chips] += player[:bet] * 2
    puts "Dealer Busts"      
  elsif dealer_total > player_total
    puts "Dealer wins!"  
  end
end

def test_for_broke(player)
  if player_broke?(player)
    system("clear")
    sleep 3
    puts "You awake in the alley"
    sleep 2
    puts "You've been beaten badly"    
    sleep 2
    puts "There is a tattoo on your forehead: #{player[:name]} Owes $#{player[:chips] * -1}"
    sleep 2
    abort
  end
end  

# Initiate

player = {}
dealer = {}

deck = create_deck

introduction(player)

# Play Loop

begin

  start_round(player,dealer,deck)

  play_player(player,dealer,deck)

  play_dealer(player,dealer,deck)
  
  determine_winner(player,dealer)

  test_for_broke(player)

end until false