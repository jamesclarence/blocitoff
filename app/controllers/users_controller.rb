class UsersController < ApplicationController
  def show
    @items = policy_scope(Item)
    @item = Item.new(user_id: current_user.id)
  end
end