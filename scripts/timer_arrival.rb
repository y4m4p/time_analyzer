#!/usr/bin/env ruby
require 'csv'
require 'date'

Dotenv.load

file_name = Date.today.to_s + '.csv'
file_path = ENV['DATA_PATH'] + file_name

system("touch #{file_path}")

CSV.open(file_path, 'a+') do |csv|
  time = Time.now.strftime("%Y-%m-%d %H:%M:%S")
  csv << [time, 0]
end
