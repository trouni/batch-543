require_relative '../slot_machine'

def test_scenario(reels, expected_score)
  it "returns #{expected_score} when given #{reels}" do
    slot_machine = SlotMachine.new(reels)
    actual_score = slot_machine.score
    expect(actual_score).to eq(expected_score)
  end
end

describe SlotMachine do
  describe '#score' do
    test_scenario(%w[🤩 🤩 🤩], 50)
    test_scenario(%w[⭐️ ⭐️ ⭐️], 40)
    test_scenario(%w[🛎 🛎 🛎], 30)
    test_scenario(%w[7️⃣ 7️⃣ 7️⃣], 20)
    test_scenario(%w[🍒 🍒 🍒], 10)
    test_scenario(%w[🤩 🤩 ⭐️], 25)
    test_scenario(%w[🤩 🤩 🍒], 25)
    test_scenario(%w[🤩 🤩 7️⃣], 25)
    test_scenario(%w[🤩 🤩 🛎], 25)
    test_scenario(%w[🤩 ⭐️ ⭐️], 20)
    test_scenario(%w[⭐️ 🤩 ⭐️], 20)
    test_scenario(%w[🤩 🛎 🛎], 15)
    test_scenario(%w[🤩 7️⃣ 7️⃣], 10)
    test_scenario(%w[🤩 🍒 🍒], 5)
    test_scenario(%w[⭐️ ⭐️ 🍒], 0)
    test_scenario(%w[🛎 ⭐️ 🛎], 0)
    test_scenario(%w[🍒 7️⃣ 🍒], 0)
    test_scenario(%w[🤩 ⭐️ 7️⃣], 0)
    test_scenario(%w[7️⃣ 7️⃣ 🛎], 0)
  end
end