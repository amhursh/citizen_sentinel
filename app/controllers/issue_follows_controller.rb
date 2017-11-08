class IssueFollowsController < ApplicationController

  def create
    user = current_user
    issue = Issue.find(params[:issue_id])
    if user.issues.include?(issue)
      flash[:success] = "Already following Issue: #{issue.name}"
      redirect_back(fallback_location: user_path(user))
    else
      user.issues << issue
      flash[:success] = %Q[Followed Issue: #{issue.name}. <a href="/users/#{user.id}">See This Issue on Your Profile</a>]
      redirect_back(fallback_location: user_path(user))
    end
  end

  def destroy
    user = current_user
    @issue = Issue.find(params[:issue_id])
    user.issues.destroy(@issue)
    # flash[:success] = "Unfollowed Issue: #{@issue.name}"

    respond_to do |format|
      format.html { redirect_back(fallback_location: user_path(user)) }
      format.js
    end
  end

end