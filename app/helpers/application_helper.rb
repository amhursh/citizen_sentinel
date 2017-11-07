module ApplicationHelper

  def user_has_issue_bill?(user, issue_bill)
    issue_bill_id = issue_bill.bill_number
    if user.bills.find_by(bill_id: issue_bill_id).nil?
      return false
    else
      return true
    end
  end

  

end
