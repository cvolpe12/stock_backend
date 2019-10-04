class Api::V1::InvestmentsController < ApplicationController
  before_action :find_investment, only: [:show, :update]
  before_action :find_stock, only: [:create, :update]
  before_action :find_user, only: [:create]

  def index
    @investments = Investment.all
    render json: @investments
  end

  def create
    @investment = Investment.new(user_id: investment_params[:user_id],ticker: @stock["01. symbol"],shares: investment_params[:shares],price_per_share: @stock["05. price"],current_price: @stock["05. price"],open_price: @stock["02. open"],sold: false)
    if @user["balance"] > (investment_params[:shares].to_f * @stock["05. price"].to_f)
      if @investment.save
        render json: @investment, status: :accepted
      else
        render json: { errors: @investment.errors.full_messages }, status: :unprocessible_entity
      end
    else
      render json: { errors: "You do not have enough in your balance." }, status: :unprocessible_entity
    end
  end

  def update
    byebug
    @investment.update(user_id: investment_params[:user_id],ticker: @stock["01. symbol"],shares: investment_params[:shares],price_per_share: @stock["05. price"],current_price: @stock["05. price"],open_price: @stock["02. open"],sold: false)
    if @investment.save
      render json: @investment, status: :accepted
    else
      render json: { errors: @investment.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def show
    render json: @investment
  end

  private

  def find_user
    @user = User.find(params[:user_id])
  end

  def find_stock
    @stock = Investment.get_stock_info(investment_params[:ticker])["Global Quote"]
  end

  def investment_params
    params.permit(:id, :user_id, :ticker, :shares, :price_per_share, :current_price)
  end

  def find_investment
    @investment = Investment.find(params[:id])
  end

end
