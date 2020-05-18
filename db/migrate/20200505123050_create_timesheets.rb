class CreateTimesheets < ActiveRecord::Migration[5.1]
  def change
    create_table :timesheets do |t|
      t.string :name
      t.integer :service_hours
      t.date :date_of_service
      t.references :employee, foreign_key: true

      t.timestamps
    end
  end
end
