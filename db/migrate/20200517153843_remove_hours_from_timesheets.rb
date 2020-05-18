class RemoveHoursFromTimesheets < ActiveRecord::Migration[5.1]
  def change
    remove_column :timesheets, :hours, :integer
    add_column :timesheets, :service_hours, :integer
  end
end
