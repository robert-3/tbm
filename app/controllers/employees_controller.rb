class EmployeesController < ApplicationController
  before_action :get_employer
  before_action :set_employee, only: [:show, :edit, :update, :destroy]

  # GET /employees
  # GET /employees.json
  def index
    @employees = @employer.employees
  end

  # GET /employees/1
  # GET /employees/1.json
  def show
    @employee = Employee.find(params[:id])
  end

  # GET /employees/new
  def new
    @employee = @employer.employees.build
  end

  # GET /employees/1/edit
  def edit
  end

  # POST /employees
  # POST /employees.json
  def create
    @employee = @employer.employees.build(employee_params)

    respond_to do |format|
      if @employee.save
        format.html { redirect_to employer_employees_path(@employer), notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @employee }
      else
        format.html { render :new }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employees/1
  # PATCH/PUT /employees/1.json
  def update
    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to employer_employees_path(@employer), notice: 'Employee was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee }
      else
        format.html { render :edit }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employees/1
  # DELETE /employees/1.json
  def destroy
    @employee.destroy
    respond_to do |format|
      format.html { redirect_to employer_employees_path(@employer), notice: 'Employee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def get_employer
      @employer = Employer.find(params[:employer_id])
    end
  
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      @employee = @employer.employees.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_params
      params.require(:employee).permit(:name, :employer_id)
    end
end
