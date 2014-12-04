EDGE = '***********************************************************************'
DASH = '  ===================================================================  '

# create each line
# add a card parts f
def show_hand(player)  
  top_line = ""
  denomination_line = ""
  suit_line = ""
  side_line = ""
  bottom_line = ""
  player[:hand].each do |card|
    top_line <<             " --- "
    denomination_line <<    "| #{card[1]}  |"
    suit_line <<            "| #{card[0]}  |"
    side_line <<            "|   |"
    bottom_line <<          " --- "
  end
end

def clear_screen
  print "\e[2J\e[f"
end 


  
  count = count_cards_in_hand(player)
  tops = count.times { top << top }
  count.times { |denomination| denominations <<  player[:hand][:denomination]}
   

    display_line(top)
    puts denomination
    puts suit
    puts sides
  end
    
  else
    puts" --- "
    puts"| ~ |"
    puts"| ~ |"
    puts"| ~ |"
    puts" --- "
    blind = 0
  end
end

def build_card 
end

def display_denomination(hand)
  line = ''
  hand.each {|card| line + card }
end

def display_line(num,line)
  num.times { puts line }
end

def count_cards_in_hand(player)
  # total cards
end

def display_dealer(dealer)
  puts "Dealer: #{Total}"
end

def display_player(player)
  puts "Name: #{player[:name]} Bet: #{player[:bet]} Cash: #{player[:cash]}"
end

def display_hand(player,blind=0)
  player[:hand].each {|card| show_card[card][:suit]}
end


def white_space(lines)
  lines.times{ puts "                                                                       " }
end

def refresh
  puts EDGE
  display_dealer(dealer)
  white_space(9)
  display_player(player)
end