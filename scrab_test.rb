require 'minitest/autorun'
require 'minitest/pride'
require './scrab_assess' 

class ScrabbleTest < Minitest::Test

  def test_it_exists
    tests  = Scrabble.new
    assert true, tests
  end

  def test_it_has_a_hash_of_letters
    tests  = Scrabble.new
    result = tests.letter.class
    assert_equal Hash, result
  end

  def test_it_returns_10_for_the_letter_Z
    tests  = Scrabble.new
    result = tests.score("z".upcase)
    assert_equal 10, result 
  end

  def test_it_scores_hello_as_8
    tests = Scrabble.new
    result = tests.score("hello".upcase)
    assert_equal 8, result
  end

  def test_it_can_return_0_for_an_empty_word
    tests = Scrabble.new
    result = tests.score("".upcase)
    assert_equal 0, result
  end

  def test_it_can_sort_an_array_of_words_lowest_to_highest
    tests  = Scrabble.new
    words  = ["hello", "zzz", "j"]
    result = tests.sort(words)
    assert_equal ["hello", "j", "zzz"], result 
  end

  def test_it_can_give_a_hash_of_total_letter_score
    tests  = Scrabble.new
    words  = "lzz"
    result = tests.letter_score(words)
    assert_equal result, {"L"=>1, "Z"=>20}
  end

  def test_it_can_give_a_hash_of_number_of_letters_in_a_word
    tests  = Scrabble.new
    word   = "zzyyy"
    result = tests.letter_frequency(word)
    assert_equal result, {"z"=>2, "y"=>3}
  end

  def test_it_can_return_highest_scoring_word_only
    tests  = Scrabble.new
    word   = ["aaa", "zzz", "jj"]
    result = tests.returns_highest_scoring_word(word)  
    assert_equal result, "zzz"
  end

  def test_it_can_return_the_highest_scoring_word_score
    tests  = Scrabble.new
    words  = ["aaa", "zzz", "eee"]
    result = tests.highest_scoring_word_value(words)
    assert_equal result, 30
  end

  def test_it_can_accumulate_a_total_score
    tests  = Scrabble.new
    words  = %w(EEE EE EA A)
    result = tests.total_word_score(words)
    assert_equal 8, result
  end

  def test_it_can_see_if_your_words_win
    tests  = Scrabble.new
    words  = %w(EEE EE EA A)
    result = tests.win?(words)
    assert_equal "You don't win", result
  end

  def test_it_can_find_the_letter_scored_the_highest
    tests  = Scrabble.new
    result = tests.letter.values.max
    assert_equal 10, result
  end

  def test_it_can_find_letter_occuring_most
    tests  = Scrabble.new
    word   = "scabs"
    result = tests.most_occuring_letter(word)
    assert_equal "S", result
  end

  def test_it_can_find_letter_occuring_least
    tests  = Scrabble.new
    word   = "Plop"
    result = tests.least_occuring_letter(word)
    assert_equal "L", result
  end

  def test_when_tied_fewest_letters_wins
    test   = Scrabble.new
    word1  = "eaiaeiaeie"
    word2  = "z"
    test.score(word1)
  end

  def test_show_avg_score_of_letters_played_for_player
    tony   = Player.new("tony")
    result = tony.play_a_word("ZI")
    assert_equal 5, result
  end


end
