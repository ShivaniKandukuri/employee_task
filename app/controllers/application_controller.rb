class ApplicationController < ActionController::Base
  helper_method :current_employee, :logged_in?
  def current_employee
    @current_employee ||= Employee.find(session[:employee_id]) if session[:employee_id]
  end

  def logged_in?
    !!current_employee
  end
  def require_employee
    if !logged_in?
      flash[:alert] = "You must be logged in to perform that action"
      redirect_to login_path
    end
  end


end
