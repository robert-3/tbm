class BudgetsController < ApplicationController
  before_action :get_employer
  before_action :set_budget, only: [:show, :edit, :update, :destroy]

  # GET /budgets
  # GET /budgets.json
  def index
    @budgets = @employer.budgets
  end

  # GET /budgets/1
  # GET /budgets/1.json
  def show
    @budget = Budget.find(params[:id])
  end

  # GET /budgets/new
  def new
    @budget = @employer.budgets.build
  end

  # GET /budgets/1/edit
  def edit
  end

  # POST /budgets
  # POST /budgets.json
  def create
    @budget = @employer.budgets.build(budget_params)

    respond_to do |format|
      if @budget.save
        format.html { redirect_to employer_budgets_path(@employer), notice: 'Budget was successfully created.' }
        format.json { render :show, status: :created, location: @budget }
      else
        format.html { render :new }
        format.json { render json: @budget.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /budgets/1
  # PATCH/PUT /budgets/1.json
  def update
    respond_to do |format|
      if @budget.update(budget_params)
        format.html { redirect_to employer_budget_path(@employer), notice: 'Budget was successfully updated.' }
        format.json { render :show, status: :ok, location: @budget }
      else
        format.html { render :edit }
        format.json { render json: @budget.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /budgets/1
  # DELETE /budgets/1.json
  def destroy
    @budget.destroy
    respond_to do |format|
      format.html { redirect_to employer_budgets_path(@employer), notice: 'Budget was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def get_employer
      @employer = Employer.find(params[:employer_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_budget
      @budget = @employer.budgets.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def budget_params
      params.require(:budget).permit(:name, :hours, :start_date, :end_date, :employer_id)
    end
end
