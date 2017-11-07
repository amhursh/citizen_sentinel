class BillFollowsController < ApplicationController

  def create
    user = current_user
    bill_id = format_bill_id(params["bill_id"])
    bill = BillsSearch.find_and_generate(bill_id)
    if user.bills.include?(bill)
      flash[:success] = "Already following Bill: #{bill.bill_id}"
      redirect_back(fallback_location: user_path(user))
    else
      user.bills << bill
      flash[:success] = %Q[Followed Bill: #{bill.bill_id}. <a href="/users/#{user.id}">See This Bill on Your Profile</a>]
      redirect_back(fallback_location: user_path(user))
    end
  end

  private

    def format_bill_id(param_bill_id)
      param_bill_id.tr('.','').downcase
    end

end