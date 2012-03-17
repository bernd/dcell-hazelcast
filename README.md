DCell::Hazelcast
================

This provides a [Hazelast](http://www.hazelcast.com/) registry for
[DCell](https://github.com/celluloid/dcell).

The Hazelcast adapter allows DCell to operate without a central registry like
Redis or Zookeeper.

CAVEAT
------

This is currently a quick hack which has not seen intensive tests and does not
provide any configuration options for Hazelcast yet.

Supported Platforms
-------------------

Since Hazelcast is a Java library, only JRuby 1.7 or JRuby 1.6 in 1.9 mode are
supported.

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

    $ jruby --1.9 -Ilib examples/dcell-hazelcast.rb -n master -p 7777
    $ jruby --1.9 -Ilib examples/dcell-hazelcast.rb -n node0 -p 7778

License
-------

## Hazelcast

Hazelcast is released under [Apache License](http://www.apache.org/licenses/LICENSE-2.0)
and the project is hosted at [Google Code](http://code.google.com/p/hazelcast).
It can be freely used in commercial or non-commercial applications.

## DCell::Hazelcast

Copyright (c) 2012 Bernd Ahlers. See LICENSE.txt for further details.
