TEST_CFG_PATH = "./config"

require "spec"
require "./settings_helper"
require "./managers_helper"
require "../src/settings"

def fileClean
  # delete test file
  begin
    File.delete TEST_CFG_PATH
  rescue
  end
end

# Read from the configuration file and
# returns a matrix composed as:
# [
#   [key, value] -> row 1
#   [key, value] -> row 2
#   ...
#   [key, value] -> row n
# ]
def fileRead
  str = File.read TEST_CFG_PATH
  result : Array(Array(String)) = [] of Array(String)
  str.each_line do |line|
    if line != "" && line.at(0) != '#' # skip commented and empty lines
      entry : Array(String) = [] of String
      entry = line.split '='
      result << entry
    end
  end
  result
end

# Takes a matrix composed as:
# [
#   [key, value] -> row 1
#   [key, value] -> row 2
#   ...
#   [key, value] -> row n
# ]
# and write it on configuration file
def fileWrite(entries : Array)
  result = ""
  entries.each do |entry|
    result += "#{entry[0]}=#{entry[1]}\n"
  end
  File.write TEST_CFG_PATH, result
end
