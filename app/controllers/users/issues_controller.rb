class Users::IssuesController < ApplicationController

  def index
    user = current_user
    @issues = user.issues

    respond_to do |format|
      format.html
      format.js
    end

  end

end