#!/usr/bin/env ruby
require 'gruff'
require 'csv'
require 'date'
require 'time'
require './subject_enum'

## 定数----------------
SIZE = 800
FILE_OUT = file_path = ENV['IMG_PATH'] + "analyze_#{Date.today.to_s}.png"

## 関数定義-------------
def setup_data
  file_name = Date.today.to_s + '.csv'
  file_path = ENV['DATA_PATH'] + file_name

  CSV.read(file_path)
end

def normalize(time_arr)
  avr = time_arr.inject(:+)
  norm_time = time_arr.map{ |v| v / avr }
  p norm_time
end


## Main---------------
csv_data = setup_data #array
time_diff = []

# convert csv 2nd value to integer, add name for 3rd attribute
csv_data.each do |row|
  row[0] = Time.parse(row[0])
  row[1] = row[1].to_i
  row << Subject::SUBJECT_NAME[row[1]]
end

## if it's the same subject, merge them into 1 value.

for row in 0..(csv_data.length - 2) do
  time_diff << csv_data[row + 1][0] - csv_data[row][0]
end

time_diff

norm_data = normalize(time_diff)
dataset = [:time, norm_data]

g = Gruff::SideStackedBar.new(SIZE)
g.title = "#{Date.today.to_s}の時間"
g.labels = { 0 => "#{Date.today.to_s}"}
dataset.each do |data|
  g.data(data)
end
g.write FILE_OUT
