require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  before(:all)do
  @item = create(:item)
  end


  describe "create items" do
    it "should create items"do
    params = {item: {item_name: "batman", item_description: "batmobile", price: 2.00}}
    post :create, params: params

    expect(Item.count).to eql(2)
    expect(subject).to redirect_to(root_path)
    end
  end

  # describe "edit items"do
  #   it "should edit items"do
  #   @item = Item.first
  #   params = {id: @item.id}
  #
  #   get :edit, params: params
  #
  #   expect(subject).to render_template(:edit)
  #
  #   end
  # end

  describe "update items"do
    it "should update items"do
      @item = Item.first
      params = {id: @item.id, item: {item_name: "badoman",item_description:"blah blah"}}
      patch :update, params: params
      @item.reload
      expect(Item.count).to eql(1)
      expect(@item.item_name).to eql("badoman")
    end
  end

  describe "delete items"do
    it "should delete items"do
      @item = Item.first
      params = {id: @item.id}
      delete :destroy, params: params

      expect(Item.count).to eql(0)
    end
  end


end
