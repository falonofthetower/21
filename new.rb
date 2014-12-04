require 'pry'

suits = ['H', 'D', 'S', 'C']
face = ['2','3','4','5','6','7','8','9','10','J','Q','K','A']
deck = suits.product(face)
deck.shuffle!

def calculate_total(hand)
  total = 0
  aces = 0
  count = hand.map { |each| each[1] }
  count.each do |value|
    if value.to_i == 0
      total += 10
    elsif value == 'A'
      total += 11
      aces += 1
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
  calculate_total(player[:hand]) > 21 ? true : false
end

def blackjack(player)
  calculate_total(player[:hand]) == 21 ? player[:blackjack] = 1 : false  
end

player = {}
dealer = {}
puts "Welcome to BlackJack"

puts "You must give your name to play here:"
player[:name] = gets.chomp

puts "How many chips do you want?"
player[:chips] = gets.chomp.to_i
begin
  puts player[:chips]
  player[:hand] = []
  dealer[:hand] = []
  player[:blackjack] = []
  dealer[:blackjack] = []

  player[:hand] << deck.pop
  dealer[:hand] << deck.pop 
  player[:hand] << deck.pop
  dealer[:hand] << deck.pop

  blackjack(player) 
  blackjack(dealer)

  puts "Place your bet!"  
  bet = gets.chomp.to_i
  player[:chips] -= bet.to_i
  begin    
    my_total = calculate_total(player[:hand])
    dealer_total = calculate_total(dealer[:hand])
    puts "Your total is: #{my_total}, dealer has: #{dealer_total}"
    puts "Hit or Stay? h/s"
    hit_or_stay = gets.chomp
    if hit_or_stay == 'h'    
      player[:hand] << deck.pop
    elsif hit_or_stay != 's'
      puts "pick (h) or (s)"    
    end
    my_total = calculate_total(player[:hand])
    bust = bust?(player)  
  end until hit_or_stay == 's' || bust

  unless bust  
    while dealer_total < 17
      dealer_total = calculate_total(dealer[:hand])
      dealer[:hand] << deck.pop      
      bust = bust?(dealer)    
    end
  end

  puts "My total: #{my_total}"
  puts "Dealer total: #{dealer_total}"  
  #binding.pry 
  if my_total > 21
    puts "#{player[:name]} busts!"
  elsif player[:blackjack] == 1
    player[:chips] += bet * 2.5
    puts "BlackJack!"    
  elsif my_total > dealer_total
    player[:chips] += bet * 2
    puts "#{player[:name]} Wins!"
  elsif dealer_total > 21
    player[:chips] += bet * 2
    puts "Dealer Busts"      
  elsif dealer_total > my_total
    puts "Dealer wins!"
  elsif my_total == dealer_total
    player[:chips] += bet
    puts "Push"  
  end
end until false
