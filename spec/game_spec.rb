require "rspec"
require_relative "../lib/game"

describe Ahorcado do

	it "should accept a key word" do
		ah = Ahorcado.new
		ah.set_key_word("ABCD")
	end

	context "If the key word is gatito" do
		before(:each) do
			@ah = Ahorcado.new
			@ah.set_key_word("gatito")
		end

		it "it should return G _ _ _ _ O for hidden key if try with gatito" do
			@ah.get_hidden_word().should == "G _ _ _ _ O"
		end

	end

	context "If the key word is GATITO" do
		before(:each) do
			@ah = Ahorcado.new
			@ah.set_key_word("GATITO")
		end



		it "it should return G _ _ _ _ O for hidden key if try with GATITO" do
			@ah.get_hidden_word().should == "G _ _ _ _ O"
		end

		it "it should return G _ _ I _ O for hidden key if play with char I" do
			@ah.play_with_char("I")
			@ah.get_hidden_word().should == "G _ _ I _ O"
		end

		it "it should win if the key word is GATITO and play with chars with  G A T I T O" do
			@ah.play_with_char("I")
			@ah.play_with_char("G")
			@ah.play_with_char("T")
			@ah.play_with_char("A")
			@ah.play_with_char("O")
			@ah.play_with_char("T")
			@ah.is_winner().should == true
		end

		it "it should not win if the key word is GATITO and play with chars with  G A T I" do
			@ah.play_with_char("I")
			@ah.play_with_char("G")
			@ah.play_with_char("A")
			@ah.is_winner().should == false
		end

		it "it should  return X F N for failed chars if the key word is GATITO and play with char with  X X F N" do
			@ah.process_failed_char("X")
			@ah.process_failed_char("X")
			@ah.process_failed_char("F")
			@ah.process_failed_char("N")
			@ah.get_formatted_failed_chars().should == "X,F,N"
		end



		it "it should  return X for failed chars if the key word is GATITO and play with char with  X" do
			@ah.play_with_char("X")
			@ah.get_failed_chars()[0].should == "X"
		end

		it "it should  return X in the failed chars if the key word is GATITO and play with chars with  T O X L" do
			@ah.play_with_char("A")
			@ah.play_with_char("D")
			@ah.play_with_char("K")
			@ah.play_with_char("V")
			@ah.play_with_char("I")
			@ah.play_with_char("X")
			@ah.get_formatted_failed_chars().should == "D,K,V,X"
		end

		it "it should  lose if the key word is GATITO and play with chars with  B C D E F X" do
			@ah.play_with_char("B")
			@ah.play_with_char("C")
			@ah.play_with_char("D")
			@ah.play_with_char("E")
			@ah.play_with_char("F")
			@ah.play_with_char("X")
			@ah.is_loser().should == true
		end

		it "it should return format key word" do
			@ah.format_key_word.should == "G A T I T O"
		end

		it "it should  return Ninguno in the failed chars if the key word is GATITO and play with chars with  ATI" do
			@ah.play_with_char("A")
			@ah.play_with_char("T")
			@ah.play_with_char("I")
			@ah.get_formatted_failed_chars().should == "Ninguna"
		end
	end

end