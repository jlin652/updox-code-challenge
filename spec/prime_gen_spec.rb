require './lib/prime_gen.rb'
require 'prime'

RSpec.describe PrimeNumberGenerator do
    let(:gen) { PrimeNumberGenerator.new }

    describe '#is_prime?' do
        it 'returns FALSE for negative numbers' do
            expect(gen.is_prime? -2).to be false
        end

        it 'returns FALSE for 0' do
            expect(gen.is_prime? 0).to be false
        end

        it 'returns FALSE for 1' do
            expect(gen.is_prime? 1).to be false
        end

        it 'returns TRUE for 2' do
            expect(gen.is_prime? 2).to be true
        end

        it 'returns TRUE for 3' do
            expect(gen.is_prime? 3).to be true
        end

        it 'returns TRUE for 5' do
            expect(gen.is_prime? 5).to be true
        end

        it 'returns TRUE for 19' do
            expect(gen.is_prime? 19).to be true
        end

        it 'returns TRUE for 23' do
            expect(gen.is_prime? 23).to be true
        end

        it 'returns TRUE for 37' do
            expect(gen.is_prime? 37).to be true
        end

        it 'returns TRUE for 101' do
            expect(gen.is_prime? 101).to be true
        end

        it 'returns TRUE for 7901' do
            expect(gen.is_prime? 7901).to be true
        end

        it 'returns TRUE for 7907' do
            expect(gen.is_prime? 7907).to be true
        end

        it 'returns TRUE for 7919' do
            expect(gen.is_prime? 7919).to be true
        end

        it 'returns FALSE for a positive even integer greater than 2' do
            expect(gen.is_prime? 1234567890).to be false
        end
    end

    
    describe '#generator' do
        it 'returns an empty array for a valid range with no primes' do
            expect(gen.generate(0, 1)).to eq []
        end

        it 'accepts negative integers in the range' do
            expect(gen.generate(-5, 5)).to eq [2, 3, 5]
        end

        it 'returns primes in order' do
            expect(gen.generate(0, 10)).to eq [2, 3, 5, 7].sort
        end

        it 'returns the same result for inverted ranges' do
            expect(gen.generate(10, 0)).to eq gen.generate(0, 10)
        end

        it 'includes the endpoints in the calculated range' do
            expect(gen.generate(43, 67)).to eq [43, 47, 53, 59, 61, 67]
        end

        it 'accepts single value ranges' do
            expect(gen.generate(11, 11)).to eq [11]
        end

        it 'correctly returns large ranges' do
            expected_primes = []
            expect(gen.generate(-100000, 100000)).to eq Prime.each(100000) { |prime| expected_primes << prime }
        end
    end
end