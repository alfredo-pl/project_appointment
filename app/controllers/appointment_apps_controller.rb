class AppointmentAppsController < ApplicationController
  before_action :set_appointment_app, only: %i[ show edit update destroy ]

  # GET /appointment_apps or /appointment_apps.json
  def index
    @appointment_apps = AppointmentApp.where(user_id: current_user)
  end

  # GET /appointment_apps/1 or /appointment_apps/1.json
  def show
  end

  # GET /appointment_apps/new
  def new
    @appointment_app = AppointmentApp.new
    @code = AppointmentApp.generator_code
  end

  # GET /appointment_apps/1/edit
  def edit
  end

  # POST /appointment_apps or /appointment_apps.json
  def create
    @appointment_app = AppointmentApp.new(appointment_app_params)

    respond_to do |format|
      if @appointment_app.save
        format.html { redirect_to @appointment_app, notice: "Appointment app was successfully created." }
        format.json { render :show, status: :created, location: @appointment_app }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @appointment_app.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /appointment_apps/1 or /appointment_apps/1.json
  def update
    respond_to do |format|
      if @appointment_app.update(appointment_app_params)
        format.html { redirect_to @appointment_app, notice: "Appointment app was successfully updated." }
        format.json { render :show, status: :ok, location: @appointment_app }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @appointment_app.errors, status: :unprocessable_entity }
      end
    end
  end

  def record_user
    @appointments_user = AppointmentApp.where(user_id: current_user)
  end

  # DELETE /appointment_apps/1 or /appointment_apps/1.json
  def destroy
    @appointment_app.destroy
    respond_to do |format|
      format.html { redirect_to appointment_apps_url, notice: "Appointment app was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appointment_app
      @appointment_app = AppointmentApp.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def appointment_app_params
      params.require(:appointment_app).permit(:user_id, :branchoffice_id, :date, :time, :duration, :code, :state)
    end
end
