#twenty_one.rb
require 'pry'

FACE_NAMES = {
  'A' => 'Ace',
  'J' => 'Jack',
  'Q' => 'Queen',
  'K' => 'King'
}

SUIT_NAMES = {
  'S' => 'Spades',
  'D' => 'Diamonds',
  'C' => 'Clubs',
  'H' => 'Hearts'
}

SUITS = ['H', 'D', 'S', 'C']
VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_deck
  SUITS.product(VALUES).shuffle
end

def busted?(hand)
  if calculate_total(hand) > 21
    return true
  else
    return false
  end
end

def calculate_total(hand)
  values = hand.map { |card| card[1] }

  hand_total = 0
  values.each do |card|
    if card == 'A'
      hand_total += 11
    elsif card.to_i == 0
      hand_total += 10
    else
      hand_total += card.to_i
    end
  end

  values.select { |value| value == 'A' }.count.times do
    hand_total -=10 if hand_total > 21
  end

  hand_total
  #binding.pry
end

def decide_victor(player1, player2)
  return :player1 if player1 > player2
  return :player2 if player2 > player1
  return :tie if player1 == player2
end

def display_hand(player, hand)
  display_array = hand.map do |card|
  	if card[1].to_i.to_s == card[1]
  	  "#{card[1]} of #{SUIT_NAMES[card[0]]}"
  	else
  	  "#{FACE_NAMES[card[1]]} of #{SUIT_NAMES[card[0]]}"
  	end
  end

  if player == 'Player'
    display_string = join_array(display_array)
  else
    display_string = join_array_computer(display_array)
  end
  display_string = "#{player} has #{display_string}"
  #binding.pry
end

def join_array(arr)
  case arr.size
  when 2
    arr.join(" and ")
  else
    arr[-1] = "and #{arr[-1]}"
    arr.join(", ")
  end
end

def join_array_computer(arr)
  display_string = arr[0] + " and another card."
end

loop do
  deck = initialize_deck
  binding.pry

  players_hand = []
  dealers_hand = []

  2.times { players_hand << deck.sample }
  2.times { dealers_hand << deck.sample }

  prompt(display_hand("Player", players_hand))
  prompt(display_hand("Dealer", dealers_hand))
  calculate_total(players_hand)

  answer = nil
  loop do
    puts ''
    prompt('Hit or Stay?')
    answer = gets.chomp.downcase

    case answer
    when 'hit'
      players_hand << deck.sample
      prompt(display_hand("Player", players_hand))
    when 'stay'
      break
    else
      prompt("Please select either 'Hit' or 'Stay'")
    end

    break if busted?(players_hand)
  end

  if busted?(players_hand)
    prompt ("Busted!")# play again?
    break
  else
    prompt("You chose to stay!")
  end

  loop do
    if calculate_total(dealers_hand) < 17
      prompt("Dealer hits!")
      dealers_hand << deck.sample
    elsif calculate_total(dealers_hand) >= 17
      prompt("Dealer stays!")
      break
    end

    break if busted?(dealers_hand)
  end

  if busted?(dealers_hand)
    prompt("The dealer busted! Congratulations, you've won!")
  else
    case decide_victor(calculate_total(players_hand),
                       calculate_total(dealers_hand))
    when :player1
      prompt("Congratulations, you've won!")
    when :player2
      prompt("Oh, no! The Dealer has won this round...")
    when :tie
      prompt("It seems you and the Dealer tied this round...")
    end
  end

  prompt("Would you like to play again? (Y/N)")
  rematch = ''
  loop do
    rematch = gets.chomp.downcase
    if rematch == 'y' || rematch == 'n'
    else
      prompt("Please enter 'Y' or 'N'.")
    end
  end

  break if rematch == 'n'
end
