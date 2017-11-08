class FullBill

  attr_reader :number,
              :number,
              :short_title,
              :intro_date,
              :sponsor,
              :committees,
              :subject,
              :congressdotgov,
              :govtrack,
              :summary,
              :actions

  def initialize(info)
    @bill_ref           = info[:bill_id]
    @number             = info[:bill]
    @short_title        = info[:short_title]
    @intro_date         = info[:introduced_date]
    @sponsor            = info[:sponsor]
    @committees         = info[:committees]
    @subject            = info[:subject]
    @congressdotgov     = info[:congressdotgov_url]
    @govtrack           = info[:govtrack_url]
    @summary            = info[:summary]
    @actions            = info[:actions]
  end

end