class ApplicationController < ActionController::Base
  include SessionsHelper
  include ContractsHelper
  add_flash_types :success, :danger, :warning

  before_action :set_locale

  def current_ability
    if current_user
      @current_ability ||= Ability.new(current_user)
    elsif current_employee
      @current_ability ||= Ability.new(current_employee)
    end
  end

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json{head :forbidden, content_type: "text/html"}
      format.html{redirect_to slots_url, notice: exception.message}
      format.js{head :forbidden, content_type: "text/html"}
    end
  end

  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    {locale: I18n.locale}
  end

  def find_user_by_id
    @user = User.find_by(id: params[:id]) ||
            User.find_by(id: session[:user_id])
    return if @user

    flash[:error] = t "users.user.user_not_found"
    redirect_to root_url
  end

  def logged_in_user
    return if logged_in?

    store_location
    flash[:error] = t "users.new.login"
    redirect_to login_url
  end
end
