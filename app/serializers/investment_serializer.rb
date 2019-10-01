class InvestmentSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :ticker, :shares, :price_per_share, :current_price
  belongs_to :user
end
