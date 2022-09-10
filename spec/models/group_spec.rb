require 'rails_helper'

RSpec.describe Group, type: :model do
  describe 'validations' do
    subject!(:user) { User.create(name: 'mar', email: 'mar@email.com', password: '123456') }
    subject!(:group) { Group.create(name: 'home', icon: 'https://upload.wikimedia.org/wikipedia/commons/9/97/Circle-icons-art.svg', user:) }

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
