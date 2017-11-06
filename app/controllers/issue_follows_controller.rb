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

end