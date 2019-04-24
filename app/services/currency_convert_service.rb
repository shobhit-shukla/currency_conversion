class CurrencyConvertService
  BASE = 'https://api.exchangeratesapi.io/history'

	# def initialize(params)
 #    @base_currency = params[:base_currency]
 #    @start_date = params[:start_date]
 #    @end_date = params[:end_date]
 #  end

  def api
    Faraday.new(url: BASE) do |faraday|
      faraday.response :logger
      faraday.adapter Faraday.default_adapter
      faraday.headers['Content-Type'] = 'application/json'
      faraday.headers['X-Mashape-Key'] = ENV['MASHAPE_KEY']
    end
  end

  def get_json(query = {})
    query_string = query.to_h.map{|k,v| "#{k}=#{v}"}.join("&")
    path = query.empty?? BASE : "#{BASE}?#{query_string}"
    response = api.get(path)
    [JSON.parse(response.body), response.status]
  end
end
