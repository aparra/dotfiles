#!/usr/bin/env ruby

group_name = ARGV[0]

puts "Updating Group #{group_name}"

Dir.glob("*/pipeline.xml") do |file_path|
  puts "* #{file_path}"
  result = "go-pipeline update --config=#{file_path} --group=#{group_name}"
  puts result
end
