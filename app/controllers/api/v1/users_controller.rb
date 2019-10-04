class Api::V1::UsersController < ApplicationController
  before_action :find_user, only: [:show, :update]

  def index
    @users = User.all
    render json: @users
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # JWT.encode(payload, 'secret')
			jwt = encode_token({user_id: @user.id})

			render json: {user: UserSerializer.new(@user), jwt: jwt}
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def update
    @user.update(user_params)
    if @user.save
      render json: @user, status: :accepted
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def show
    render json: @user
  end

  private

  def user_params
    params.permit(:email, :password, :name, :balance, :investing)
  end

  def find_user
    @user = User.find(params[:id])
  end

end
