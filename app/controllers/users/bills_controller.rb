class Users::BillsController < ApplicationController

  def index
    user = current_user
    @bills = user.bills

    respond_to do |format|
      format.html
      format.js
    end
  end

end