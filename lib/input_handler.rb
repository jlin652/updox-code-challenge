class InputHandler
    def valid_input?(input)
        return false if input.nil?
        input.match?(/\A-?(?!0+)\d+$/) || input.eql?('0')
    end

    def prompt_first_bound
        puts "Enter the first bound:"
        print "> "
    end

    def prompt_second_bound
        puts "Enter the second bound:"
        print "> "
    end

    def prompt_invalid
        puts "Invalid input"
    end
end
