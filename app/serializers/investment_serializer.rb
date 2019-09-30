class InvestmentSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :stock_id, :shares, :price_per_share, :current_price
end
