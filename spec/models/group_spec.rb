require 'rails_helper'

RSpec.describe Group, type: :model do
  describe 'validations' do
    subject!(:user) { User.create(name: 'mar', email: 'mar@email.com', password: '123456') }
    subject!(:group) { Group.create(name: 'home', icon: 'credit-card', user_id: user.id) }

    it 'requires a name' do
      group.name = nil
      expect(group).to_not be_valid
    end

    it 'requires an icon' do
      group.icon = nil
      expect(group).to_not be_valid
    end
  end
end
