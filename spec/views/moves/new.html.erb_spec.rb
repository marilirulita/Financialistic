require 'rails_helper'

RSpec.describe 'moves/new', type: :view do
  before(:each) do
    assign(:move, Move.new)
  end

  it 'renders new move form' do
    render
  end
end
