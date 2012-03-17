require 'dcell/hazelcast/jars'
require 'forwardable'

module DCell
  class Hazelcast
    import 'com.hazelcast.core.Hazelcast'
    import 'com.hazelcast.config.Config'

    def self.shutdown_all
      Hazelcast.shutdown_all
    end

    def initialize
      cfg = Config.new
      cfg.set_property('hazelcast.version.check.enabled', 'false')

      @hazelcast = Hazelcast.init(cfg)
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
