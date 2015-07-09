require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

require "pry"

["simplecov", "repository", "model"].each do |file|
  require File.join(File.dirname(__FILE__), "support" , file)
end
