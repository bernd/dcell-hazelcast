require 'dcell/hazelcast'

module DCell
  module Registry
    class HazelcastAdapter
      def initialize(options = {})
        @hazelcast = Hazelcast.new
        @node_registry = NodeRegistry.new(@hazelcast)
        @global_registry = GlobalRegistry.new(@hazelcast)
      end

      def clear_nodes
        @node_registry.clear
      end

      def clear_globals
      end

      class NodeRegistry
        def initialize(hazelcast)
          @map = hazelcast.get_map('nodes')
        end

        def get(node_id)
          @map.get(node_id)
        end

        def set(node_id, addr)
          @map.put(node_id, addr)
        end

        def nodes
          @map.key_set.to_a
        end

        def clear
          @map.clear
        end
      end

      def get_node(node_id)
        @node_registry.get(node_id)
      end

      def set_node(node_id, addr)
        @node_registry.set(node_id, addr)
      end

      def nodes
        @node_registry.nodes
      end

      class GlobalRegistry
        def initialize(hazelcast)
          @map = hazelcast.get_map('globals')
        end

        def get(key)
          string = @map.get(key.to_s)
          Marshal.load(string) if string
        end

        def set(key, value)
          string = Marshal.dump(value)
          @map.put(key.to_s, string)
        end

        def global_keys
          @map.key_set.to_a
        end

        def clear
          @map.clear
        end
      end

      def get_global(key)
        @global_registry.get(key)
      end

      def set_global(key, value)
        @global_registry.set(key, value)
      end

      def global_keys
        @global_registry.global_keys
      end
    end
  end
end
