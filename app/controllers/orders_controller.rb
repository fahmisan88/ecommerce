class OrdersController < ApplicationController

  def create

    @orders = Order.create(total: params[:price], user_id: params[:user_id])

    authorize @orders

    if @orders.save
      @bill = Billplz.create_bill_for(@orders)
      @orders.update_attributes(bill_id: @bill.parsed_response['id'], bill_url: @bill.parsed_response['url'])
      redirect_to @bill.parsed_response['url']
    else
      render :new
    end

    # @item.each do |f|
    #   @ordereditem = @orders.ordered_items.new(item_id: f.id )
    #   binding.pry
    # end

  end
  #
  # def get_cart
  #   if cookies[:cart]
  #     @cart = JSON.parse(cookies[:cart])
  #   else
  #     @cart = {}
  #   end
  #
  #   @items = []
  #
  #   @cart.each do |item_id, quantity|
  #     item = Item.find_by(id: item_id)
  #
  #     item.define_singleton_method(:quantity) do
  #       quantity
  #     end
  #     @items << item
  #   end
  #   return @items
  # end

end
