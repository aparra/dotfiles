#!/usr/bin/env ruby

LAST_FILTER='<ignore pattern="*" />'
project_name = ARGV[0]

if project_name == nil
  usage = "Usage >> pipeline_ignore.rb <project_name_to_ignore>"
  puts usage
  exit 1
end

puts "Ignoring changes for #{project_name}"

eligible_pipelines = Dir.glob("*/pipeline.xml")
pipelines = eligible_pipelines.reject {|f| f.start_with?(project_name) }

pipelines.each do |file_name|
  puts "* #{file_name}"
  content = File.read(file_name)
  content[LAST_FILTER] = 
    "<ignore pattern=\"#{project_name}/**/*\" />" + "\n" + LAST_FILTER.rjust(30, ' ')
  File.open(file_name, "w") {|f| f.puts content }
end

