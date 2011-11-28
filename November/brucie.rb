require 'test/unit'

class CardIsHigherTest < Test::Unit::TestCase


	def test_second_card_greater_than_first_card
    assert_equal(Brucie.highest_card("3H", "5H"), "5H")
  end

	def test_first_card_greater_than_second_card
		assert_equal(Brucie.highest_card("QS","AS"), "QS")
	end

	def test_equal_card_rank_returns_catchphrase
		assert_equal(Brucie.highest_card("5D","5C"), Brucie::PAIR_CATCHPHRASE)
	end

	def test_parsing_card_numbers()
    assert_equal(Brucie.parse_card("2H"), 2)
  end

	def test_parsing_ace_should_return_1
		assert_equal(Brucie.parse_card("AC"), 1)
	end

	def test_parsing_king_should_return_13
		assert_equal(Brucie.parse_card("KC"), 13)
	end

	def test_parsing_queen_should_return_12
		assert_equal(Brucie.parse_card("QC"), 12)
	end

	def test_parsing_jack_should_return_11
		assert_equal(Brucie.parse_card("JC"), 11)
	end

	def test_parsing_ten_should_return_10
		assert_equal(Brucie.parse_card("10H"), 10)
	end

end

class Brucie

	PAIR_CATCHPHRASE = "You get nothing for a pair, not in this game"

	PICTURE_CARDS = {"A"=>1, "K"=>13, "Q"=>12, "J"=>11}

  def self.parse_card(card)
		card = card[0...-1]


		PICTURE_CARDS[card] == nil ? card.to_i : PICTURE_CARDS[card]

	end

	def self.highest_card (card1, card2)
		parsed_card1 = parse_card(card1)
		parsed_card2 = parse_card(card2)
		if parsed_card1 == parsed_card2
			return PAIR_CATCHPHRASE
		end
		if parsed_card1 > parsed_card2
			return card1
		else
			return card2
		end
	end

end