class ProPublicaService

  def initialize
    @conn = Faraday.new("https://api.propublica.org") do |f|
      f.headers["X-API-Key"] = ENV["PROPUBLICA_API_KEY"]
      f.adapter Faraday.default_adapter
    end
  end

  def bills_by_issue(issue)
    response = @conn.get("/congress/v1/bills/subjects/#{issue}.json")
    JSON.parse(response.body, symbolize_names: true)[:results]
  end

  def self.bills_by_issue(issue)
    new.bills_by_issue(issue)
  end
end