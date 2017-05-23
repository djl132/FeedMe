class PinsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @pin = Pin.new(pin_params)
    @pin.user = current_user
    if @pin.save!
      user_feed = client.feed('user', current_user.id)
      activity_data = { :actor => current_user.id, :verb => 'pin', :object => @pin.item_id}
      user_feed.add_activity(activity_data)
      flash[:success] = "Pinned!"
      redirect_to root_path
    end
  end

  def destroy
    @pin = Pin.find(params[:id])
    if @pin.destroy
      user_feed = client.feed('user', current_user.id)
      user_feed.remove_activity(@pin.item_id, foreign_id=true)
      flash[:success] = "Unpinned!"
      redirect_to root_path
    end
      redirect_to root_path
  end


  private

  def pin_params
    params.require(:pin).permit(:item_id)
  end

end
