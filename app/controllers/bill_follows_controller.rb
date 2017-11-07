class BillFollowsController < ApplicationController

  def create
    user = current_user
    bill_id = format_bill_id(params["bill_id"])
    bill = BillsSearch.find_and_generate(params[:bill_id])
    user.bills << bill
  end

  private

    def format_bill_id(param_bill_id)
      param_bill_id.tr('.','').downcase
    end

end