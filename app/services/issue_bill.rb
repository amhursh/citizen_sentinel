class IssueBill

  attr_reader :bill_ref,
              :bill_id,
              :bill_number,
              :bill_uri,
              :title,
              :sponsor_uri,
              :introduced_date,
              :committees,
              :last_action_date,
              :last_major_action

  def initialize(info)
    @bill_ref           = info[:bill_id]
    @bill_id            = info[:number]
    @bill_number        = info[:bill_slug]
    @bill_uri           = info[:bill_uri]
    @title              = info[:title]
    @sponsor_uri        = info[:sponsor_uri]
    @introduced_date    = info[:introduced_date]
    @committees         = info[:committees]
    @last_action_date   = info[:latest_major_action_date]
    @last_major_action  = info[:latest_major_action]
  end

end