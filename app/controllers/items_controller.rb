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

  def destroy
    @item = Item.find(param[:item_id])
    authorize @item

    if @item.destroy
      flash[:notice] = "Item deleted from your to-do list"
      redirect_to user_path, :notice => "Your to-do list has been updated."
    else
      flash[:error] = "Item was not deleted"
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def item_params
    params.require(:item).permit(:body, :name)
  end
end
