class UsersController < ApplicationController
  def show
    @items = Item.order("days_left ASC").all
    @item = Item.new(user_id: current_user.id)
  end
end