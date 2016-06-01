#!/usr/bin/env ruby

group_name = ARGV[0]

if group_name == nil
  usage = "Usage >> ruby go_pipeline_update.rb <go_ci_group_name>"
  puts usage
  exit 1
end

puts "Updating Group #{group_name}"

Dir.glob("*/pipeline.xml") do |file_path|
  puts "* #{file_path}"
  result = `go-pipeline update --config=#{file_path} --group=#{group_name}`
  puts result
end
