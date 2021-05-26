class BranchofficesController < ApplicationController
  before_action :set_branchoffice, only: %i[ show edit update destroy ]

  # GET /branchoffices or /branchoffices.json
  def index
    @branchoffices = Branchoffice.all
  end

  # GET /branchoffices/1 or /branchoffices/1.json
  def show
  end

  # GET /branchoffices/new
  def new
    @branchoffice = Branchoffice.new
  end

  # GET /branchoffices/1/edit
  def edit
  end

  # POST /branchoffices or /branchoffices.json
  def create
    @branchoffice = Branchoffice.new(branchoffice_params)

    respond_to do |format|
      if @branchoffice.save
        format.html { redirect_to @branchoffice, notice: "Branchoffice was successfully created." }
        format.json { render :show, status: :created, location: @branchoffice }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @branchoffice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /branchoffices/1 or /branchoffices/1.json
  def update
    respond_to do |format|
      if @branchoffice.update(branchoffice_params)
        format.html { redirect_to @branchoffice, notice: "Branchoffice was successfully updated." }
        format.json { render :show, status: :ok, location: @branchoffice }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @branchoffice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /branchoffices/1 or /branchoffices/1.json
  def destroy
    @branchoffice.destroy
    respond_to do |format|
      format.html { redirect_to branchoffices_url, notice: "Branchoffice was successfully destroyed." }
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
