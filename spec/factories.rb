class Currency
  attr_accessor :base_currency, :start_at, :end_at
end

FactoryBot.define do
  factory :currency do
    base_currency { "INR" }
    start_at  { Date.today - 2.days }
    end_at { Date.today }
  end
end
