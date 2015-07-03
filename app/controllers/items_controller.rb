class ItemsController < ApplicationController
  def create
    @item = Item.new(item_params)
    @item.user = current_user

    if @item.save
      flash[:notice] = "Item saved to to-do list"
      redirect_to current_user
    else
      flash[:error] = "Item not saved to to-do list"
    end
  end

  def destroy
    @item = Item.find(params[:id])

    if @item.destroy
      flash[:notice] = "Item deleted from your to-do list"
      redirect_to current_user
    else
      flash[:error] = "Item was not deleted"
    end
  end

  private

  def item_params
    params.require(:item).permit(:body, :name)
  end
end
