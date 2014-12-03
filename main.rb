require 'pry'
require_relative 'cards'
require_relative 'player'

player = get_player
computer = get_player(true)
deck = shuffle_decks(set_of_cards)
binding.pry

begin
  puts "Your bet?"
  set_player_bet(player,gets.chomp)
    deal_round(player,computer,deck)
    binding.pry
#   begin
#     check_player_cards
#     players_choice
#   until resolution
    
#   begin
#     check_dealer_cards
#     dealers_doom
#   until resolution

#   if unresolved_players?
#     showdown
   end
# end until deck_is_low?