class UsersController < ApplicationController
  def index
    @users = User.all
    # render json: @users
  end
  def show
    @user = User.find(params[:id])
  end

  def create
    # インスタンスを model から作成する
    @user = User.new(
      name: params[:name],
      account: params[:account],
      email: params[:email],
    )

    # インスタンスを DB に保存する
    @user.save!
    # json として値を返す
    render :show
  end
end
