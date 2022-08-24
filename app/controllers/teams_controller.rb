class TeamsController < ApplicationController
  before_action :set_team, only: [ :show,:employees ]

  def index
    @teams = Team.all
  end

  def show
  end
  def new
    @team = Team.new
  end
  def employees
    @employees=@team.employees
  end

  def create
    @team = Team.new(team_params)
    @team.added_by=current_employee.role.name
    @team.organization_id=1
      if @team.save
        flash[:notice]="team created successfully"
        redirect_to @team
      else
        render 'new'
      end

  end

  private
    def set_team
      @team = Team.find(params[:id])
    end

    def team_params
      params.require(:team).permit(:name)
    end
end
