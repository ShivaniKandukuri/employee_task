class IdcardsController < ApplicationController
  def index
    @idcards=Idcard.all
  end
  def show
    @idcard=Idcard.find(params[:id])
  end
  def new
    @idcard=Idcard.new
  end
  def create
    @idcard=Idcard.new(idcard_params)
    @idcard.organization_id=1
    if @idcard.save
      flash[:notice]="idcard created successfully"
      redirect_to idcards_path
    else
      render 'new'
    end

  end
  private
  def idcard_params
    params.require(:idcard).permit(:employee_id)
  end
end
