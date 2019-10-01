class Api::V1::InvestmentsController < ApplicationController
  before_action :find_investment, only: [:show]

  def index
    @investments = Investment.all
    render json: @investments
  end

  def create
    @investment = Investment.new(investment_params)
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

  def investment_params
    params.permit(:id, :user_id, :ticker, :shares, :price_per_share, :current_price)
  end

  def find_investment
    @investment = Investment.find(params[:id])
  end

end
