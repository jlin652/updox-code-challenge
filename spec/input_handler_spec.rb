require './lib/input_handler.rb'

RSpec.describe InputHandler do
    let(:handler) { InputHandler.new }

    describe '#valid_input?' do
        it 'allows positive integers' do
            expect(handler.valid_input? '9').to be true
        end

        it 'allows 0' do
            expect(handler.valid_input? '0').to be true
        end

        it 'allows negative integers' do
            expect(handler.valid_input? '-8').to be true
        end

        it 'does not allow empty strings' do
            expect(handler.valid_input? '').to be false
        end

        it 'does not allow positive floats' do
            expect(handler.valid_input? '9.83442').to be false
        end

        it 'does not allow positive floats' do
            expect(handler.valid_input? '-9.83442').to be false
        end

        it 'does not allow words' do
            expect(handler.valid_input? 'ten').to be false
        end

        it 'does not allow plus signs' do
            expect(handler.valid_input? '+9').to be false
        end

        it 'does not allow -0' do
            expect(handler.valid_input? '-0').to be false
        end

        it 'does not allow comma separators' do
            expect(handler.valid_input? '8,763').to be false
        end

        it 'does not allow space separators' do
            expect(handler.valid_input? '1 987').to be false
        end

        it 'does not allow underscore separators' do
            expect(handler.valid_input? '1_098_098').to be false
        end

        it 'does not allow exponents' do
            expect(handler.valid_input? '9^0').to be false
        end

        it 'does not allow scientific notation' do
            expect(handler.valid_input? '6e45').to be false
        end

        it 'does not allow leading zeroes' do
            expect(handler.valid_input? '09').to be false
        end

        it 'does not allow negatives with leading zeroes' do
            expect(handler.valid_input? '-09').to be false
        end

        it 'does not allow a range' do
            expect(handler.valid_input? '8-19').to be false
        end

        it 'does not allow misc characters' do
            expect(handler.valid_input? ':~)').to be false
        end

        it 'does not allow non-Latin characters' do
            expect(handler.valid_input? 'ひらがな').to be false
        end

        it 'does not allow newline characters' do
            expect(handler.valid_input? "\n").to be false
        end

        it 'does not allow return characters' do
            expect(handler.valid_input? "\r").to be false
        end

        it 'does not allow NIL' do 
            expect(handler.valid_input? nil).to be false
        end
    end

    describe '#prompt_first_bound' do
        it 'prompts for first bound and ends with > for a prompt' do
            expect do
                handler.prompt_first_bound
            end.to output("Enter the first bound:\n> ").to_stdout
        end
    end

    describe '#prompt_second_bound' do
        it 'prompts for second bound and ends with > for a prompt' do
            expect do
                handler.prompt_second_bound
            end.to output("Enter the second bound:\n> ").to_stdout
        end
    end

    describe '#prompt_invalid' do
        it 'displays error message' do
            expect do
                handler.prompt_invalid
            end.to output("Invalid input\n").to_stdout
        end
    end
end