#!/usr/local/bin/ruby

require_relative 'runxfoil'

options = Hash.new
options['airf'] = "2412"
options['alfa'] = "6"
result = runxfoil(options)
puts 'CL: ' + result['CL'].to_s
puts 'CD: ' + result['CD'].to_s
if !result['CL'].eql?('0.9111')
  exit 1
end
if !result['CD'].eql?('0.00788')
  exit 1
end

