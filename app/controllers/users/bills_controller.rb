class Users::BillsController < ApplicationController

  def index
    user = current_user
    @bills = user.bills

    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    bill_ref = params[:bill_ref]
    @bill = BillsSearch.get_full(bill_ref)
  end

end