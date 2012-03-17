require 'java'

Dir[File.join(File.dirname(__FILE__), "jars/*.jar")].each do |jar|
  require jar
end
