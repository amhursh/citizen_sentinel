class BillsSearch

  def self.by_issue(issue)
    raw_bills = ProPublicaService.bills_by_issue(issue)
    raw_bills.map do |bill_info|
      IssueBill.new(bill_info)
    end
  end
end