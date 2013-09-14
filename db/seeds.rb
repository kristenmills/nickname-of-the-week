# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'
Time.zone = 'Eastern Time (US & Canada)'
data = CSV.read(Rails.root.join('db', 'seed_data.csv'))
data.shift

data.each do |row|
  Week.create(
                semester:   row[0],
                number:     row[1],
                event:      row[2],
                start_date: Time.zone.parse(row[3]),
                end_date:   Time.zone.parse(row[4])
              )
end