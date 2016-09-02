require 'rails_helper'

RSpec.describe OrderedItemsController, type: :controller do
  describe "create ordered item"do
    it "should create ordered items"do
      params = {ordered_item: {quantity: 2, item_id: 1}}
      post :create, params: params
      binding.pry
      expect(session.count).to eql(1)
    end
  end
end
