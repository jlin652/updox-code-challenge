class PrimeNumberGenerator
    def generate(endpoint1, endpoint2)
        endpoint1, endpoint2 = endpoint2, endpoint1 if endpoint1 > endpoint2
        prime_list = []
        (endpoint1..endpoint2).each do |i|
            prime_list << i if is_prime? i
        end
        prime_list
    end

    def is_prime?(number)
        return false if number < 2
        (2..Math.sqrt(number)).none? { |d| number % d == 0 }
    end

end
