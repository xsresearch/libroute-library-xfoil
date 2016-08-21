#!/usr/bin/env ruby

require 'libroute/component'
require_relative 'runxfoil'

Libroute::Component.run do |options|

  runxfoil(options)
  
end

