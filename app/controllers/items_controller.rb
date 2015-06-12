class ItemsController < ApplicationController
  def create
    @item = Item.create
  end
end
