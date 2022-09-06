require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    subject { User.new(name: 'mar', email: 'mar@email.com', password: '123456') }
    before { subject.save }

    it 'should not be valid without a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'should not be valid without an email' do
      subject.email = nil
      expect(subject).to_not be_valid
    end
  end
end
