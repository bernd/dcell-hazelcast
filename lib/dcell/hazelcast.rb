require 'dcell/hazelcast/jars'
require 'forwardable'

module DCell
  class Hazelcast
    class LogListener
      def log(event)
        DCell::Logger.info(event.get_log_record.get_message)
      end
    end

    java_import 'com.hazelcast.core.Hazelcast'
    java_import 'java.util.logging.Level'
    java_import 'java.lang.System'

    def self.shutdown_all
      Hazelcast.shutdown_all
    end

    def initialize
      # Disable default logging to avoid messages to STDOUT.
      System.set_property('hazelcast.logging.type', 'none')

      cfg = com.hazelcast.config.Config.new
      cfg.set_property('hazelcast.version.check.enabled', 'false')
      cfg.set_property('hazelcast.memcache.enabled', 'false')
      cfg.set_property('hazelcast.rest.enabled', 'false')

      # Disable system log to avoid messages to STDOUT.
      cfg.set_property('hazelcast.system.log.enabled', 'false')

      # Set hazelcast group name to avoid hazelcast instances joining other
      # existing groups.
      cfg.get_group_config.set_name('hz-dcell')

      @hazelcast = Hazelcast.new_hazelcast_instance(cfg)
      @hazelcast.get_logging_service.add_log_listener(Level::INFO, LogListener.new)
    end

    def get_map(name)
      Map.new(@hazelcast, name)
    end

    class Map
      extend Forwardable

      def_delegators :@map, :get, :put, :key_set, :clear

      def initialize(hazelcast, name)
        @map = hazelcast.get_map(name)
      end
    end
  end
end
