class Admin::UsersController < ApplicationController
  layout 'admin'
  before_action :authenticate_user!
  before_action :authenticate_admin!
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def edit
  end

  def update
    if @user.update_without_current_password(user_params)
      redirect_to admin_user_path(@user), notice: 'ユーザー情報を更新しました。'
    else
      render :edit
    end
  end

  def destroy
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:email, :name, :zip, :address, :password, :password_confirmation)
    end
end
