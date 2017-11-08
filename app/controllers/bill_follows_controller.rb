class BillFollowsController < ApplicationController

  def create
    user = current_user
    bill_ref = params[:bill_ref]
    bill = BillsSearch.find_and_generate(bill_ref)
    if user.bills.include?(bill)
      flash[:success] = "Already following Bill: #{bill.bill_id}"
      redirect_back(fallback_location: user_path(user))
    else
      user.bills << bill
      flash[:success] = %Q[Followed Bill: #{bill.bill_id}. <a href="/users/#{user.id}">See This Bill on Your Profile</a>]
      redirect_back(fallback_location: user_path(user))
    end
  end

  def destroy
    user = current_user
    @bill = Bill.find(params[:bill_id])
    user.bills.destroy(@bill)
    # flash[:success] = "Unfollowed Bill: #{@bill.bill_id}"

    respond_to do |format|
      format.html { redirect_back(fallback_location: user_path(user)) }
      format.js
    end
  end

end