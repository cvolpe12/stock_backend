class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :balance
  # has_many :stocks
  has_many :investments
end
