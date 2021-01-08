#!/usr/bin/env ruby


# 01101000 01100101 01101100 01101100 01101111 00100000 01110100 01101000 01100101 01110010 01100101 00100000 01100011 01100001 01101101 01110010 01100101 01101110

 

class Binary
    def initialize(binary)
        @binary = binary
    end
    
    Goop = {"0" => 8, "1" => 4, "2" => 2, "3" => 1}

    Values = {
        "1" => "1",
        "2" => "2",
        "3" => "3",
        "4" => "4",
        "5" => "5",
        "6" => "6",
        "7" => "7",
        "8" => "8",
        "9" => "9",
        

        "10" => "A", 
        "11" => "B", 
        "12" => "C", 
        "13" => "D", 
        "14" => "E", 
        "15" => "F" 
    }

    def to_hex
        pl = @binary.split(' ') 

        hex_array = pl.map do |bit_str|
           process(bit_str)  
        end
        c = hex_array.join('').gsub(/(.{2})/, '\1 ')
        puts c
        c.strip
        
    end

    def process(bit_str)
        a = bit_str.split('')
        
        value = 0

        a.each_with_index do |bit, index|
            next if bit == "0"
            
            value += Binary::Goop[index.to_s] 
          
        end
        Values[value.to_s]
    end

    def to_ascii
        hex = to_hex
         d = hex.gsub(' ','')
         [d].pack('H*')
    end
end




require 'rspec'

describe Binary do 
 
    describe '#initialize' do 
        it 'initializes' do 
            expect(Binary.new('0101 0011')).to be_an_instance_of(Binary)
        end
    end

    describe '#to_hex' do 
        it 'converts single byte to hex' do 
            expect(Binary.new('1111').to_hex).to eq('F')    
        end

        it 'converts two bytes to hex' do 
            expect(Binary.new('1111 1010').to_hex).to eq('FA')    
        end

        it 'converts three bytes to hex' do 
            expect(Binary.new('1111 1010 0001').to_hex).to eq('FA 1')    
        end
       
    end
    describe '#to_ascii' do 
        it 'converts camren to ascii' do
            expect(Binary.new('0110 0011 0110 0001 0110 1101 0111 0010 0110 0101 0110 1110').to_ascii).to eq('camren')
        end
    end

end