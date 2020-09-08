class Employees::SessionsController < Devise::SessionsController
  def create
    super
    after_sign_in_path_for(contracts_path)
  end

  def destroy
    super
    after_sign_out_path_for(new_employee_session_path)
  end

  protected

  def after_sign_in_path_for resource
    stored_location_for(resource) || contracts_path
  end

  def after_sign_out_path_for resource
    stored_location_for(resource) || new_employee_session_path
  end
end
