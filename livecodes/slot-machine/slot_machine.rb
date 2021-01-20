class SlotMachine
  attr_reader :reels

  SYMBOLS = %w[🍒 7️⃣ 🛎 ⭐️ 🤩]

  def initialize(reels = [])
    @reels = reels
  end

  def play
    60.times do
      # @reels = []
      # 3.times { @reels << SYMBOLS.sample }
      @reels = [0, 0, 0].map { SYMBOLS.sample }
      print reels.join("\t") + "\r"
      $stdout.flush # use this with '\r' to write over the same last line in the terminal
      sleep(0.05)
    end
    sleep(0.5)
    reels
  end

  def score
    if three_of_the_same?
      # When all 3 reels are identical
      unique_symbol = reels[0]
      symbol_value(unique_symbol) * 10
    elsif two_of_the_same_plus_joker?
      # When 2 reels are identical and there is a Joker
      double_symbol = reels.sort[1]
      symbol_value(double_symbol) * 5
    else
      # Everything else (no points)
      0
    end
  end

  private

  def symbol_value(symbol)
    # We get the index of the symbol in the SYMBOLS array and add 1
    SYMBOLS.index(symbol) + 1
  end

  def three_of_the_same?
    # After removing the duplicates in the reels using #uniq there should be only one item left
    reels.uniq.count == 1
  end

  def two_of_the_same_plus_joker?
    reels.uniq.count == 2 && reels.include?('🤩')
  end
end
