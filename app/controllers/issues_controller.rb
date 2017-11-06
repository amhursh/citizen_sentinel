class IssuesController < ApplicationController

  def new
    @issues = Issue.all
  end

end