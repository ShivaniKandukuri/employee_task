class RolesController < ApplicationController
  before_action :set_role, only: [ :show,:employees ]

  def index
    @roles = Role.all
  end

  def show
  end
  def new
    @role = Role.new
  end
  def employees
    @employees=@role.employees
  end

  def create
    @role = Role.new(role_params)
    @role.organization_id=1
      if @role.save
        flash[:notice]="role created successfully"
        redirect_to @role
      else
        render 'new'
      end

  end

  private
    def set_role
      @role = Role.find(params[:id])
    end

    def role_params
      params.require(:role).permit(:name)
    end
end
