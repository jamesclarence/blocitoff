class UsersController < ApplicationController
  def show
    @items = Item.all
    @item = Item.new(user_id: current_user.id)
  end
end
