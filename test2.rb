require 'pry'
hand = [["C", "4"], ["H", "8"], ["H", "6"], ["S", "J"]]

def calculate_total(hand)
  total = 0
  aces = 0
  count = hand.map { |each| each[1] }
  count.each do |value|
    if value == 'A'
      total += 11
      aces += 1
      puts total
    elsif value.to_i == 0
      total += 10
      puts total    
    else
      total += value.to_i
      puts total      
    end

    while total > 21 && aces > 0
      total += -10
      aces += -1
      puts total
    end    
  end
  puts total
end
calculate_total(hand)