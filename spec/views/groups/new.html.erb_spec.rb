require 'rails_helper'

RSpec.describe 'groups/new', type: :view do
  before(:each) do
    assign(:group, Group.new)
  end

  it 'renders new group form' do
    render
  end
end
