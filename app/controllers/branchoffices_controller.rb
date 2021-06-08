class BranchofficesController < ApplicationController
  before_action :set_branchoffice, only: %i[ show edit update destroy ]
  before_action :authenticate_admin! , only: %i[ index edit create new update destroy]
  # GET /branchoffices or /branchoffices.json
  def index
    @business = Business.find params[:business_id]
    @branchoffices = @business.branchoffices
  end

  # GET /branchoffices/1 or /branchoffices/1.json
  def show
    @switch = true
    @atention_schedules = @branchoffice.atention_schedule
    @atention_schedule = AtentionSchedule.new
    @appointment_app = AppointmentApp.new
  end
  def appointments_branchoffices
    @appointments = AppointmentApp.events_calendar(params[:id])
    render json:  @appointments
  end
  # GET /branchoffices/new
  def new
    @business = Business.find params[:business_id]
    @branchoffice = Branchoffice.new
  end

  # GET /branchoffices/1/edit
  def edit
    @business = Business.find params[:business_id]
    @branchoffice = Branchoffice.find(params[:id])
  end

  # POST /branchoffices or /branchoffices.json
  def create
    @business = Business.find params[:business_id]
    @branchoffice = Branchoffice.new(branchoffice_params.merge(business: @business))

    respond_to do |format|
      if @branchoffice.save
        format.html { redirect_to business_branchoffice_path(@business,@branchoffice), notice: "Branchoffice was successfully created." }
        
      else
        format.html { render :new, status: :unprocessable_entity }
       
      end
    end
  end

  # PATCH/PUT /branchoffices/1 or /branchoffices/1.json
  def update
    @business = Business.find params[:business_id]
    @branchoffice = Branchoffice.find params[:id]
    respond_to do |format|
      if @branchoffice.update(branchoffice_params.merge(business: @business))
        format.html { redirect_to business_branchoffice_path(@business,@branchoffice), notice: "Branchoffice was successfully updated." }
        
      else
        format.html { render :edit, status: :unprocessable_entity }
       
      end
    end
  end

  # DELETE /branchoffices/1 or /branchoffices/1.json
  def destroy
    @branchoffice = Branchoffice.find params[:id]
    @branchoffice.destroy
    respond_to do |format|
      format.html { redirect_to business_branchoffices_url, notice: "Branchoffice was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_branchoffice
      @branchoffice = Branchoffice.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def branchoffice_params
      params.require(:branchoffice).permit(:business_id, :code_branchoffice, :city, :address)
    end
end
