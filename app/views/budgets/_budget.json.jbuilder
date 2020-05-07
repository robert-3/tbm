json.extract! budget, :id, :name, :hours, :start_date, :end_date, :employer_id, :created_at, :updated_at
json.url budget_url(budget, format: :json)
