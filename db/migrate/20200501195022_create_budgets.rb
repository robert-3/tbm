class CreateBudgets < ActiveRecord::Migration[5.1]
  def change
    create_table :budgets do |t|
      t.string :name
      t.integer :hours
      t.date :start_date
      t.date :end_date
      t.references :employer, foreign_key: true

      t.timestamps
    end
  end
end
