class ItemsController < ApplicationController
  def create
    @items = Item.new
  end
end
