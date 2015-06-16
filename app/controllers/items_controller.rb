class ItemsController < ApplicationController
  def create
    @item = Item.new(item_params)
    @item.user = current_user

    if @item.save
      flash[:notice] = "Item saved to to-do list"
      redirect_to user_route_path, :notice => "Your to-do list has been updated."
    else
      flash[:error] = "Item not saved to to-do list"
    end
  end

  private

  def item_params
    params.require(:item).permit(:body, :name)
  end
end
