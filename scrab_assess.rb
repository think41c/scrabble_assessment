class Scrabble
  attr_reader :letter, :letter_frequency

  def initialize
    @scores  = 0 
    @letter = { "A"=>1, "B"=>3, "C"=>3, "D"=>2,
                "E"=>1, "F"=>4, "G"=>2, "H"=>4,
                "I"=>1, "J"=>8, "K"=>5, "L"=>1,
                "M"=>3, "N"=>1, "O"=>1, "P"=>3,
                "Q"=>10,"R"=>1, "S"=>1, "T"=>1,
                "U"=>1, "V"=>4, "W"=>4, "X"=>8,
                "Y"=>4, "Z"=>10 
                }
  end

  def score(word)
    @scores = 0 
    word.upcase.each_char { |x| @scores += @letter[x] } 
    @scores
  end

  def sort(words)
    words.sort_by { |x| x.each_char { |z| @scores += @letter[z.upcase] }}
  end

  def letter_score(word)
    @letter_score = Hash.new(0)
    word.upcase.each_char { |x| @letter_score[x] += @letter[x] }
    @letter_score
  end

  def letter_frequency(word)
    @letter_count = Hash.new(0)
    word.each_char { |x| @letter_count[x] += 1 }
    @letter_count
  end

  def multiply_the_values_of_alpha
    letter_times_3 = {}
    letter_times_3 = scrabble.letter.each.map do |key, value| 
      value * 3
    end
    letter_times_3
  end

  def all_words_played_score(word)
    all_words = {}
    result = 0
    word.each do |x| 
      result = score(x.upcase)
    end
    result 
  end

  def returns_highest_scoring_word(word)
    sort(word).last
  end

  def highest_scoring_word_value(words)
    best_word = returns_highest_scoring_word(words)
    new_word  = best_word.upcase
    score(new_word)
  end

  def total_word_score(words)
    total_score = 0 
    words.each do |x|
      total_score += score(x)
    end
    total_score
  end

  def win?(words)
    total_score = total_word_score(words)
    if total_score >= 100 then
      "You win"
    else
      "You don't win"
    end
  end
end

scrabble = Scrabble.new
words = ["hello", "zzz", "j"]
p scrabble.total_word_score(words)
p scrabble.win?(words)
# two same, least number of letters win
# max_by