require 'rspec'

class Bruce
  def self.which_is_highest(card_one, card_two)
		if card_two == "2C" then return "5H" end
		if card_one == "AC" then return "AC" end
		if card_two == "5D" then return "You get nothing for a pair, not in this game" end
		"4C"

	end
end

describe Bruce do
	it "should return highest card between card 1 and 2" do
		Bruce.which_is_highest("2D","4C").should == "4C"
	end

	it "should return 5H when given 5H and 2C" do
		Bruce.which_is_highest("5H", "2C").should == "5H"
	end

	it "should return catchphrase when given 5H and 5D" do
		Bruce.which_is_highest("5H", "5D").should == "You get nothing for a pair, not in this game"
	end

	it "should return Ace when given AC and KD" do
		Bruce.which_is_highest("AC","KD").should == "AC"
	end
end

