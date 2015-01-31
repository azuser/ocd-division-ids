#!/usr/bin/env ruby
# coding: utf-8

require File.expand_path(File.join("..", "utils.rb"), __FILE__)

# Scrapes Nova Scotia electoral district codes and names from electionsnovascotia.ca

class NS < Runner
  def names
    ShapefileParser.new(
      "https://electionsnovascotia.ca/sites/default/files/NS_EDBoundaries2012.zip",
      "province:ns/ed:", {
        :id => "DIST_NO",
        :name => "DISTRICT",
      }
    ).run
  end
end

NS.new("province-ns-electoral_districts.csv").run(ARGV)
