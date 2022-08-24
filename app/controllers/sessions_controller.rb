class SessionsController < ApplicationController
  def new
  end
  def create
    employee = Employee.find_by(email: params[:session][:email].downcase)
    if employee && employee.authenticate(params[:session][:password])
      session[:employee_id] = employee.id
      flash[:notice] = "Logged in successfully"
      redirect_to root_path
    else
      flash.now[:alert] = "There was something wrong with your login details"
      render 'new'
    end
  end
  def destroy
    session[:employee_id] = nil
    flash[:notice] = "Logged out"
    redirect_to root_path
  end
end
