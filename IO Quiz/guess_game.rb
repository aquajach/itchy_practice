#This file is to simulate a guessing quiz that players try to guess the correct 4 digits (0~9) in the correct order
#For a correct guess, the game ends and say congratulations to the player;
#Otherwise, the system tells how many digits are matched in the correct place, and how many are matched but in the wrong place, then the game goes on.
#For example if the result is 3412, the guess of 9813 will return 2 right digits and 1 of them is in the correct place


def run
  #handle invalid input
  guess = gets
  guess.strip!
  unless guess =~ /\d/ and guess.length == 4
    puts 'Please retry with a valid combination of 4 digits, e.g. 1234'
    run
  end

  response = {correct_digits: 0, correct_place: 0}
  guess.each_char do |char|
    if @result.include? char.to_i
      response[:correct_digits] += 1
    end
  end

  guess.each_char.to_a.each_with_index do |char, index|
    if char == @result[index].to_s
      response[:correct_place] += 1
    end
  end

  if response[:correct_place] == 4 && response[:correct_digits] == 4
    puts "You got it! The result is #{@result.join}"
  else
    puts "Your have #{response[:correct_digits]} digits correct, and #{response[:correct_place]} are in the right place."
    run
  end
end

@result = [rand(0..9), rand(0..9), rand(0..9), rand(0..9)]

puts 'Please give 4 digits to guess the result...'

run