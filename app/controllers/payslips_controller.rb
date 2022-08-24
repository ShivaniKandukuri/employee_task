class PayslipsController<ApplicationController
  before_action :set_payslip,only:[:show]
  def index
    @payslips=Payslip.all
  end

  def new
    @payslip=Payslip.new
  end
  def create
    @payslip = Payslip.new(payslip_params)
    @payslip.organization_id=1
    @payslip.takehome=(@payslip.employee.salary)*90/100
    @payslip.grosspay=(@payslip.employee.salary)
    @payslip.deductions=(@payslip.employee.salary)*10/100
    @payslip.house_rent=(@payslip.employee.salary)*15/100
    @payslip.basic=(@payslip.employee.salary)*45/100
    @payslip.conveyence=(@payslip.employee.salary)*5/100
    @payslip.fixed=(@payslip.employee.salary)*15/100
    @payslip.medical=(@payslip.employee.salary)*20/100
    @payslip.professional_tax=(@payslip.employee.salary)*5/100
    @payslip.epf_contribution=(@payslip.employee.salary)*15/100
    if @payslip.save
      flash[:notice]="Payslip is generated successfully"
      redirect_to @payslip
    else
      render 'new'
    end
  end
  def show
    respond_to do |format|
     format.html
     format.pdf do
       render pdf: "payslip id: #{@payslip.id}",template: "payslips/payslip.html.erb"   # Excluding ".pdf" extension.
     end
   end
  end
  private
  def set_payslip
    @payslip=Payslip.find(params[:id])
  end
  def payslip_params
    params.require(:payslip).permit(:employee_id)
  end
end
