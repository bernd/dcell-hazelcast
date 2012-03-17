require 'dcell'
require 'dcell/registries/hazelcast_adapter'
require 'optparse'

# The DCell node_id
name = nil

# The local port for the 0MZ communication.
port = nil

registry = {:adapter => 'hazelcast'}

OptionParser.new.tap { |options|
  options.on('-n NAME', 'Node name') do |value|
    name = value
  end
  options.on('-p PORT', 'Node port') do |value|
    port = value.to_i
  end
}.parse(ARGV)

unless name or port
  puts "Missing options. See -h for available options."
  exit 1
end

class TimeServer
  include Celluloid

  def run
    "[#{DCell.me.id}] #{Time.now}"
  end
end

class StatusServer
  include Celluloid

  def run
    "[#{DCell.me.id}] STATUS OK"
  end
end

DCell.start(:id => name, :addr => "tcp://127.0.0.1:#{port}", :registry => registry)

if name == 'master'
  TimeServer.supervise_as :service
else
  StatusServer.supervise_as :service
end

loop do
  puts DCell::Node.all.inspect
  puts DCell::Node.all.shuffle.first[:service].run

  sleep 1
end
