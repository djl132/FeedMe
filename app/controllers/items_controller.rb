class ItemsController < ApplicationController

  before_action :authenticate_user!

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.user_id = current_user.id
    @item.save
    puts "#{Item.all}"
    flash[:success] = "Item created!"
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:message, :title)
  end

end
