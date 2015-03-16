
def calculate_total(cards)
  arr = cards.map{|e| e[1]}

  total = 0
  arr.each do |value|
    if value == "Ace"
      total += 11
    elsif value.to_i == 0
      total += 10
    else
      total += value.to_i
    end
  end

  arr.select{|e| e == "Ace"}.count.times do
    total -=10 if total > 21
  end

  total
end


suits = ['Diamonds', 'Clubs', 'Hearts', 'Spades']
cards = ['Ace', '2', '3', '4', '5', '6', '7', '8', '9', 'Jack', 'Queen', 'King']

puts "Welcome to Blackjack!"
puts "Ready to play?"
ready_to_play = gets.chomp
puts "-----------"

deck = suits.product(cards)
deck.shuffle!

my_cards = []
dealer_cards = []

my_cards << deck.pop
dealer_cards << deck.pop
my_cards << deck.pop
dealer_cards << deck.pop

dealertotal = calculate_total(dealer_cards)
mytotal = calculate_total(my_cards)

puts "Dealers card is #{dealer_cards[0]}."
puts "Your cards are #{my_cards[0]} and #{my_cards[1]} totaling #{mytotal}"
puts "-----------"

 if mytotal == 21 && dealertotal < 21
  puts "blackjack, you win"
  exit
 end

if dealertotal == 21 && mytotal < 21
  puts "Dealer Blackjack, you lose"
  exit
end

while mytotal < 21
puts "Hit or Stay (1 or 2)"
hit_or_stay = gets.chomp

  if !['1', '2'].include?(hit_or_stay)
    puts "Error: enter 1 or 2"
    next
  end

if hit_or_stay == '2'
  puts "You chose to stay"
break
end

new_card = deck.pop
puts "Your new card is #{new_card}"
my_cards << new_card
mytotal = calculate_total(my_cards)
puts "making your total #{mytotal}"

if mytotal == 21
    puts "congratulations, 21"
    
  elsif mytotal > 21
    puts "Bust, you lose"
    exit
  end
end

puts "-------------"

while dealertotal < 17
  new_card = deck.pop
  puts "Dealers new card is #{new_card}"
  dealer_cards << new_card
  dealertotal = calculate_total(dealer_cards)
  puts "Dealers total is #{dealertotal}"
  puts "------------"
  if dealertotal == 21 
    puts "Dealer wins"
    exit
  elsif dealertotal > 21
    puts "Dealer Busted! You win"
    exit
  end
end

#compare

if dealertotal > mytotal
  puts "You lose"
end

if mytotal > dealertotal
  puts "You win"
end

if mytotal = dealertotal
  puts "Push"
end


