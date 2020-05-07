json.extract! timesheet, :id, :name, :hours, :date_of_service, :employee_id, :created_at, :updated_at
json.url timesheet_url(timesheet, format: :json)
