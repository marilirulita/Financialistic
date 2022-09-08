require 'rails_helper'

RSpec.describe MovesController, type: :routing do
  describe 'routing' do

    it 'routes to #new' do
      expect(get: 'groups/1/moves/new').to route_to('moves#new', group_id: '1')
    end

    it 'routes to #create' do
      expect(post: 'groups/1/moves').to route_to('moves#create', group_id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: 'groups/1/moves/1').to route_to('moves#destroy', group_id: '1', id: '1')
    end
  end
end
