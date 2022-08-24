class EmployeesController < ApplicationController
  before_action :set_employee,only:[:show,:edit,:update,:destroy,:idcard,:payslip,:team,:asset,:role,:likes]
  before_action :require_employee, only: [:edit, :update]
  before_action :require_same_employee, only: [:edit, :update,:destroy]

  def index
    @employees=Employee.paginate(page: params[:page], per_page: 3)
  end
  def new
    @employee=Employee.new
  end
  def idcard
    @idcard=@employee.idcard
  end
  def asset
    @asset=@employee.device
  end
  def role
    @role=@employee.role
  end
  def payslip
    @payslip=@employee.payslip
    respond_to do |format|
     format.html
     format.pdf do
       render pdf: "payslip id: #{@payslip.id}",template: "employees/payslip.html.erb"   # Excluding ".pdf" extension.
     end
   end
  end
  def team
    @team=@employee.team
  end
  def new_hire
    @employees=Employee.where(dateofjoining:(Date.current.all_month ) )
  end

  def create
    @employee=Employee.new(employee_params)
    @employee.organization_id=1
    if @employee.save
      session[:employee_id] = @employee.id
      flash[:notice]="employee created successfully"
      redirect_to @employee
    else
      render 'new'
    end
  end
  def show

  end
  def edit
  end
  def update
    if @employee.update(employee_params)
      flash[:notice] = "Employee updated successfully"
      redirect_to @employee
    else
      render 'edit'
    end
  end
  def destroy
    @employee.destroy
    session[:employee_id] = nil if @employee == current_employee
    flash[:notice] = "Employee successfully deleted"
    redirect_to root_path
  end
  private
  def set_employee
    @employee=Employee.find(params[:id])
  end
  def employee_params
    params.require(:employee).permit(:first_name,:last_name,:designation,:salary,:age,:gender,:email,:password,:device_id,:address,:dateofjoining,:mobilenumber,:team_id,:role_id)
  end
  def require_same_employee
    if current_employee != @employee && !(current_employee.designation=='admin')
      flash[:alert] = "You can only edit your own account"
      redirect_to @employee
    end
  end


end
