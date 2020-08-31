class SessionsController < ApplicationController
  def new; end

  def create
    user = find_user_by_email
    if user&.authenticate params[:session][:password]
      flash[:success] = t ".login_success"
      log_in user
      redirect_to root_url
    else
      flash[:error] = t ".invalid_login"
      render :new
    end
  end

  def destroy
    log_out if logged_in?
    flash[:success] = t ".logout_success"
    redirect_to root_url
  end

  private

  def find_user_by_email
    User.find_by email: params[:session][:email].downcase
  end
end
