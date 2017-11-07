class BillFollowsController < ApplicationController

  def create
    binding.pry
    bill_id = format_bill_id(params[:bill_id])

  end

  private

    def format_bill_id(param_bill_id)
      param_bill_id.
    end

end