class BillsSearch

  def self.by_issue(issue)
    raw_bills = ProPublicaService.bills_by_issue(issue)
    raw_bills.map do |bill_info|
      IssueBill.new(bill_info)
    end
  end

  def self.find_and_generate(bill_ref)
    raw_bill = ProPublicaService.find_bill(bill_ref)
    Bill.from_pro_publica(raw_bill)
  end

  def self.get_full(bill_ref)
    raw_bill = ProPublicaService.get_full_bill(bill_ref)
    FullBill.new(raw_bill)
  end
end