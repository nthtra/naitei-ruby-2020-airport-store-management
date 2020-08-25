class ApplicationController < ActionController::Base
  include SessionsHelper
  include EmployeeSessionsHelper

  before_action :set_locale

  def logged_in_employee
    return if employee_logged_in?

    flash[:error] = t ".please_log_in"
    redirect_to employees_login_path
  end

  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    {locale: I18n.locale}
  end

  def find_user_by_id
    @user = User.find_by id: params[:id]
    return if @user

    flash[:danger] = t "users.user.user_not_found"
    redirect_to root_url
  end

  def logged_in_user
    return if logged_in?

    store_location
    flash[:danger] = t "users.new.login"
    redirect_to login_url
  end

  def find_employee
    @employee = Employee.find_by id: params[:id]
    return if @employee

    flash[:error] = t ".employee_not_found"
    redirect_to root_path
  end
end
