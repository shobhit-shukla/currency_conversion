# frozen_string_literal: true
require 'rails_helper'

RSpec.describe CurrencyConvertService do
  describe '#get_json' do
    it 'sucessfully parse currency api content' do
    	currency = CurrencyConvertService.new
    	attrs = attributes_for(:currency)
      expect(currency.get_json(attrs)[1]).to eq 200
      expect(currency.get_json(attrs)[0].keys).to eq %w(base rates end_at start_at)
    end
  end
end
