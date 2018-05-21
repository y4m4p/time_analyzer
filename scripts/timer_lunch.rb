#!/usr/bin/env ruby
require 'csv'
require 'date'

file_name = Date.today.to_s + '.csv'
file_path = ENV['DATA_PATH'] + file_name

CSV.open(file_path, 'a+') do |csv|
  time = Time.now.strftime("%Y-%m-%d %H:%M:%S")
  csv << [time, 1]
end
