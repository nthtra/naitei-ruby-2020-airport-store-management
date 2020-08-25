class UsersController < ApplicationController
  def show
    @user = User.find_by id: params[:id]
    return if @user

    flash[:error] = t ".user_not_found"
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = t ".sign_up_success"
      redirect_to @user
    else
      render :new
    end
  end

  def stores
    @stores = @user.stores.order_by_created_at_asc.page(params[:page])
                   .per Settings.pagination.per_page
    redirect_to :show_stores
  end

  private

  def user_params
    params.require(:user).permit User::PERMITTED_PARAMS
  end
end
