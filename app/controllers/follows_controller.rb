class FollowsController < ApplicationController
  before_action :authenticate_user!

  def create
    follow = Follow.new(follow_params)
    follow.user = current_user
    if current_user.id != params[:target_id] && follow.save

      user_feed = client.feed('user', current_user.id)
      # target_feed = client.feed('user', follow.target_id)
      puts "USER'S FEED: #{user_feed.inspect}"
      # puts "TARGET'S FEED: #{target_feed.inspect}"

      activity_data = { :actor => current_user.id, :verb => 'follow', :object => follow.target_id}

      # update user's own actibity feed
      user_feed.add_activity(activity_data)
      # update user's timeline feed to follow target's feed
      user_feed.follow('user', follow.target_id)
      activities = user_feed.get(:limit => 10)
      puts activities.inspect

    end
    flash[:success] = 'Followed!'
    redirect_to users_path
  end


  def destroy
    follow = Follow.find(params[:id])
    if follow.user_id == current_user.id
      follow.destroy!

    end
    flash[:success] = 'Unfollowed!'
    redirect_to users_path
  end




  private

  def follow_params
    params.require(:follow).permit(:target_id)
  end
end
