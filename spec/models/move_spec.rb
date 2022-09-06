require 'rails_helper'

RSpec.describe Move, type: :model do
  describe "validations" do
    
    subject!(:user) { User.create(name: "mar", email: "mar@email.com", password: "123456") }
    subject!(:move) { Move.create(name: "food", amount: "20.5", author_id: user.id) }

    it "requires a name" do
      move.name = nil
      expect(move).to_not be_valid
    end

    it "requires an amount" do
      move.amount = nil
      expect(move).to_not be_valid
    end
  end
end
