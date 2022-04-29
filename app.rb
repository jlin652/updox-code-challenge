require './lib/input_handler.rb'
require './lib/prime_gen.rb'

handler = InputHandler.new
prime_gen = PrimeNumberGenerator.new

puts "Prime number generator"
puts "Returns all prime numbers between the given bounds, inclusive."
puts "Accepts base 10 integers (e.g. 0, 39, -4, etc.) as bounds."
puts "To exit the program, enter 'exit'"
puts "\n"

while true
    bound1 = ''
    bound2 = ''

    # Prompt and validate first input
    until handler.valid_input? bound1
        handler.prompt_first_bound
        bound1 = gets.chomp
        Process.exit if bound1 == 'exit'
        handler.prompt_invalid unless handler.valid_input? bound1
    end

    # Prompt and validate second input
    until handler.valid_input? bound2
        handler.prompt_second_bound
        bound2 = gets.chomp
        Process.exit if bound2 == 'exit'
        handler.prompt_invalid unless handler.valid_input? bound2
    end

    # Display results
    puts "Found the following primes in the range [#{bound1}, #{bound2}]:"
    p prime_gen.generate(bound1.to_i, bound2.to_i)
    puts "\n"
end
