ruby-fsevent
============

A native extension exposing the OS X FSEvent API.
Register directories you want to watch and a callback will fire whenever a
change occurs in the registered directories.

I got tired of reinstalling RubyCocoa every time I installed a new version of
Ruby just to rspactor working. Watchr has changed the game by allowing generic
file handlers but I started waiting 4-5 seconds for an event to fire. With a
generic, native interface to the FSEvent API we can harness the speed of
FSEvents without depending on RubyCocoa.

Demo
----

1. cd ext/
2. ruby extconf.rb
3. make
4. cd ../
5. ruby examples/print_changes.rb
6. Notice that the examples directory and the /tmp directories are being monitored
7. Make a change to either directory and watch the callback fire

TODO
----

* Add ability to register a block as a callback handler, on_change would then
call the block. This removes the need for subclassing.

Note on Patches/Pull Requests
-----------------------------

* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a
  future version unintentionally.
* Commit, do not mess with rakefile, version, or history.
  (if you want to have your own version, that is fine but
   bump version in a commit by itself I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.

Copyright
---------

Copyright (c) 2009 Sandro Turriate. See LICENSE for details.