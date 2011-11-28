require 'test/unit'

class CardIsHigherTest < Test::Unit::TestCase

  def assertion(one, two, winner)
    assert_equal(Brucie.highest_card(one, two), winner)
  end

  def test_5H_great_than_3H
    assertion "3H", "5H", "5H"
  end

  def test_KH_great_than_QH
    assertion "KH", "QH", "KH"
  end

  def test_KH_equal_KS
    assertion "KH", "KS", Brucie::CATCHPHRASE
  end

  def test_AH_equal_AC
    assertion "AH", "AC", Brucie::CATCHPHRASE
  end

  def test_AH_equal_2C
    assertion "AH", "2C", "AH"
  end

  def test_10H_equal_10C
    assertion "10H", "9C", "10H"
  end

  def test_10H_equal_10C
    assertion "10H", "10C", Brucie::CATCHPHRASE
  end
end

class Brucie

  CATCHPHRASE = "You get nothing for a pair, not in this game!"

  def self.ordering
    {
      "A"  => 1, "K" => 2,  "Q" => 3,  "J" => 4,
      "10" => 5, "9" => 6,  "8" => 7,  "7" => 8,
      "6"  => 9, "5" => 10, "4" => 11, "3" => 12,
      "2"  => 13
     }
  end

  def self.highest_card(card_one, card_two)
    if self.ordering[card_one[0...-1]] < self.ordering[card_two[0...-1]]
      return card_one
    elsif self.ordering[card_one[0...-1]] > self.ordering[card_two[0...-1]]
      return card_two
    end
    Brucie::CATCHPHRASE
  rescue
    "You did something silly."
  end
end