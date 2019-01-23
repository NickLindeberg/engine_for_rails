FactoryBot.define do
  factory :item do
    name { "Widget" }
    description { "It likes to wiggle like a widget should" }
    unit_price { 1 }
    merchant { nil }
  end
end
