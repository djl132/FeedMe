class FollowsController < ApplicationController
  before_action :authenticate_user!

  def create
    follow = Follow.new(follow_params)
    follow.user = current_user
    if follow.save && current_user.id != params[:target_id]
      puts follow.user_id
      puts follow.target_id

      puts client
      chris = client.feed('user', 'chris')


    end
    flash[:success] = 'Followed!'
    redirect_to users_path
  end

  activity_data = { :actor => 'chris', :verb => 'add', :object => 'picture:10', :foreign_id => 'picture:10', :message => 'Cool bird.' }
  chris.add_activity(activity_data);

  def destroy
    follow = Follow.find(params[:id])
    if follow.user_id == current_user.id
      follow.destroy!
      [StreamRails.feed_manager.unfollow_user(follow.user_id, follow.target_id)]
    end
    flash[:success] = 'Unfollowed!'
    redirect_to users_path
  end

  private

  def follow_params
    params.require(:follow).permit(:target_id)
  end
end
