require "rspec"

Dir[File.join(File.dirname(__FILE__), "../lib/**/*.rb")].each { |file| require file }
RSpec.configure { |config| config.order = "random" }
