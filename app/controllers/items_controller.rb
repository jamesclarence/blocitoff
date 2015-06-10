class ItemsController < ApplicationController
  def create
    @items = Item.create
  end
end
