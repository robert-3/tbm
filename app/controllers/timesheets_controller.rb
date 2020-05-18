class TimesheetsController < ApplicationController
  before_action :get_employee
  before_action :set_timesheet, only: [:show, :edit, :update, :destroy]

  # GET /timesheets
  # GET /timesheets.json
  def index
    @timesheets = @employee.timesheets
  end

  # GET /timesheets/1
  # GET /timesheets/1.json
  def show
  end

  # GET /timesheets/new
  def new
    @timesheet = @employee.timesheets.build
  end

  # GET /timesheets/1/edit
  def edit
  end

  # POST /timesheets
  # POST /timesheets.json
  def create
    @timesheet = @employee.timesheets.build(timesheet_params)

    respond_to do |format|
      if @timesheet.save
        format.html { redirect_to employee_timesheets_path(@employee), notice: 'Timesheet was successfully created.' }
        format.json { render :show, status: :created, location: @timesheet }
      else
        format.html { render :new }
        format.json { render json: @timesheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /timesheets/1
  # PATCH/PUT /timesheets/1.json
  def update
    respond_to do |format|
      if @timesheet.update(timesheet_params)
        format.html { redirect_to employee_timesheet_path(@employee), notice: 'Timesheet was successfully updated.' }
        format.json { render :show, status: :ok, location: @timesheet }
      else
        format.html { render :edit }
        format.json { render json: @timesheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /timesheets/1
  # DELETE /timesheets/1.json
  def destroy
    @timesheet.destroy
    respond_to do |format|
      format.html { redirect_to employee_timesheets_path(@employee), notice: 'Timesheet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def get_employee
      @employee = Employee.find(params[:employee_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_timesheet
      @timesheet = @employee.timesheets.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def timesheet_params
      params.require(:timesheet).permit(:name, :service_hours, :date_of_service, :employee_id, :budget_id)
    end
end
