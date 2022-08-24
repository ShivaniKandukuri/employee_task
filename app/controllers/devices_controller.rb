class DevicesController < ApplicationController
  before_action :set_device, only: [ :show,:employees ]

  def index
    @devices = Device.all
  end

  def show
  end
  def employees
    @employees=@device.employees
  end
  def new
    @device = Device.new
  end

  def create
    @device = Device.new(device_params)
    @device.organization_id=1
      if @device.save
        flash[:notice]="device created successfully"
        redirect_to @device
      else
        render 'new'
      end

  end

  private
    def set_device
      @device = Device.find(params[:id])
    end

    def device_params
      params.require(:device).permit(:name, :price)
    end
end
