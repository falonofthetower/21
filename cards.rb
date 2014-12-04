def set_of_cards
  set_of_cards = [{ suit: "hearts", color: "red", face_value: "A", value: 11 },
                { suit: "hearts", color: "red", face_value: "2", value: 2 },
                { suit: "hearts", color: "red", face_value: "3", value: 3 },
                { suit: "hearts", color: "red", face_value: "4", value: 4 },
                { suit: "hearts", color: "red", face_value: "5", value: 5 },
                { suit: "hearts", color: "red", face_value: "6", value: 6 },
                { suit: "hearts", color: "red", face_value: "7", value: 7 },
                { suit: "hearts", color: "red", face_value: "8", value: 8 },
                { suit: "hearts", color: "red", face_value: "9", value: 9 },
                { suit: "hearts", color: "red", face_value: "10", value: 10 },
                { suit: "hearts", color: "red", face_value: "J", value: 10 },
                { suit: "hearts", color: "red", face_value: "Q", value: 10 },
                { suit: "hearts", color: "red", face_value: "K", value: 10 },
                { suit: "diamonds", color: "red", face_value: "A", value: 11 },
                { suit: "diamonds", color: "red", face_value: "1", value: 2 },
                { suit: "diamonds", color: "red", face_value: "2", value: 3 },
                { suit: "diamonds", color: "red", face_value: "3", value: 4 },
                { suit: "diamonds", color: "red", face_value: "4", value: 5 },
                { suit: "diamonds", color: "red", face_value: "5", value: 6 },
                { suit: "diamonds", color: "red", face_value: "6", value: 7 },
                { suit: "diamonds", color: "red", face_value: "7", value: 8 },
                { suit: "diamonds", color: "red", face_value: "8", value: 9 },
                { suit: "diamonds", color: "red", face_value: "9", value: 10 },
                { suit: "diamonds", color: "red", face_value: "10", value: 10 },
                { suit: "diamonds", color: "red", face_value: "J", value: 10 },
                { suit: "diamonds", color: "red", face_value: "Q", value: 10 },
                { suit: "diamonds", color: "red", face_value: "K", value: 10 },
                { suit: "diamonds", color: "red", face_value: "A", value: 11 },
                { suit: "spades", color: "black", face_value: "2", value: 2 },
                { suit: "spades", color: "black", face_value: "3", value: 3 },
                { suit: "spades", color: "black", face_value: "4", value: 4 },
                { suit: "spades", color: "black", face_value: "5", value: 5 },
                { suit: "spades", color: "black", face_value: "6", value: 6 },
                { suit: "spades", color: "black", face_value: "7", value: 7 },
                { suit: "spades", color: "black", face_value: "8", value: 8 },
                { suit: "spades", color: "black", face_value: "9", value: 9 },
                { suit: "spades", color: "black", face_value: "10", value: 10 },
                { suit: "spades", color: "black", face_value: "J", value: 10 },
                { suit: "spades", color: "black", face_value: "Q", value: 10 },
                { suit: "spades", color: "black", face_value: "K", value: 10 },
                { suit: "clubs", color: "black", face_value: "A", value: 11 },
                { suit: "clubs", color: "black", face_value: "2", value: 2 },
                { suit: "clubs", color: "black", face_value: "3", value: 3 },
                { suit: "clubs", color: "black", face_value: "4", value: 4 },
                { suit: "clubs", color: "black", face_value: "5", value: 5 },
                { suit: "clubs", color: "black", face_value: "6", value: 6 },
                { suit: "clubs", color: "black", face_value: "7", value: 7 },
                { suit: "clubs", color: "black", face_value: "8", value: 8 },
                { suit: "clubs", color: "black", face_value: "9", value: 9 },
                { suit: "clubs", color: "black", face_value: "10", value: 10 },
                { suit: "clubs", color: "black", face_value: "J", value: 10 },
                { suit: "clubs", color: "black", face_value: "Q", value: 10 },
                { suit: "clubs", color: "black", face_value: "K", value: 10 }]                
end

def shuffle_decks(set_of_cards)
  set_of_cards.shuffle!  
end

def deal_card(deck)
  deck.pop
end

def deal_round(player,dealer,deck)
  reset_player_active(player)
  hit(player,deck)
  hit(dealer,deck)
  hit(player,deck)
  hit(dealer,deck)  
end