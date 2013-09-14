json.array!(@weeks) do |week|
  json.extract! week, :number, :semester, :event, :start_date, :end_date
  json.url week_url(week, format: :json)
end
