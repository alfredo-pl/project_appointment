class AtentionSchedulesController < ApplicationController
  before_action :set_atention_schedule, only: %i[ show edit update destroy ]

  # GET /atention_schedules or /atention_schedules.json
  def index
    @atention_schedules = AtentionSchedule.all
  end

  # GET /atention_schedules/1 or /atention_schedules/1.json
  def show
  end

  # GET /atention_schedules/new
  def new
    @atention_schedule = AtentionSchedule.new
  end

  # GET /atention_schedules/1/edit
  def edit
  end

  # POST /atention_schedules or /atention_schedules.json
  def create
    @atention_schedule = AtentionSchedule.new(atention_schedule_params)

    respond_to do |format|
      if @atention_schedule.save
        format.html { redirect_to @atention_schedule, notice: "Atention schedule was successfully created." }
        format.json { render :show, status: :created, location: @atention_schedule }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @atention_schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /atention_schedules/1 or /atention_schedules/1.json
  def update
    respond_to do |format|
      if @atention_schedule.update(atention_schedule_params)
        format.html { redirect_to @atention_schedule, notice: "Atention schedule was successfully updated." }
        format.json { render :show, status: :ok, location: @atention_schedule }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @atention_schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /atention_schedules/1 or /atention_schedules/1.json
  def destroy
    @atention_schedule.destroy
    respond_to do |format|
      format.html { redirect_to atention_schedules_url, notice: "Atention schedule was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_atention_schedule
      @atention_schedule = AtentionSchedule.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def atention_schedule_params
      params.require(:atention_schedule).permit(:branchoffice_id, :day, :hour_init, :hour_end)
    end
end
