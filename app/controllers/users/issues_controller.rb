class Users::IssuesController < ApplicationController

  def index
    user = current_user
    @issues = user.issues

    respond_to do |format|
      format.html
      format.js
    end

  end

  def show
    @user = current_user
    @issue = Issue.find(params[:id])
    @bills_by_issue = BillsSearch.by_issue(@issue.slug)
  end

end