class HomeController < ApplicationController
	def index
	end

	def create
		response = CurrencyConvertService.new.get_json(currency_params)[0]
		@chart_data = set_chart_data(response['rates'])
	end

	private
	def currency_params
		params.require(:currency).permit(:base_currency, :start_at, :end_at)
	end

	def set_chart_data(response)
		xarr = ['x', response.keys].flatten
		ckeys = response.values.first.keys
		yarr = ckeys.map{|curr| [curr, response.values.map{|cval| cval.fetch(curr) if cval.has_key?(curr)}].flatten}
		yarr.insert(0, xarr)
	end
end
