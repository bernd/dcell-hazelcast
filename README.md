DCell::Hazelcast
----------------

This provides a [Hazelcast](http://www.hazelcast.com/) registry for
[DCell](https://github.com/celluloid/dcell).

The Hazelcast adapter allows DCell to operate without a central registry like
Redis or Zookeeper. It is using Hazelcast's distributed map data structure to
implement the node registry and the global registry for DCell.

CAVEAT
------

This is currently a quick hack which has not seen intensive tests and does not
provide any configuration options for Hazelcast yet.

Supported Platforms
-------------------

JRuby (>= 1.7)

Prerequisites
-------------

Please follow the [instructions for DCell](https://github.com/celluloid/dcell).

Usage
-----

```ruby
require 'dcell'
require 'dcell/registries/hazelcast'

DCell.start(:registry => {:adapter => 'hazelcast'})
```

Please see the DCell documentation for further details.

There is an executable example in `examples/dcell-hazelcast.rb`.

    $ jruby -Ilib examples/dcell-hazelcast.rb -n master -p 7777
    $ jruby -Ilib examples/dcell-hazelcast.rb -n node0 -p 7778

License
-------

### Hazelcast

Hazelcast is released under [Apache License](http://www.apache.org/licenses/LICENSE-2.0)
and the project is hosted at [GitHub](https://github.com/hazelcast).
It can be freely used in commercial or non-commercial applications.

### DCell::Hazelcast

Copyright (c) 2012 Bernd Ahlers. See LICENSE.txt for further details.
