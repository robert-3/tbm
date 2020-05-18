class AddBudgetIdToTimesheets < ActiveRecord::Migration[5.1]
  def change
    add_column :timesheets, :budget_id, :integer
  end
end
