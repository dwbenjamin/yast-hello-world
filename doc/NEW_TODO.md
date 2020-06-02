# YaST How to build a new module, Part 5
## This is a simple guide for non-developers
+ Part 1 -- START-HERE.md
+ Part 2 -- TEAM-DEV.md
+ Part 3 -- OBS.md
+ Part 4 -- CUSTOMIZE.md
+ Part 5 -- This document

### Prerequisites
New customized module from **Part 4 -- CUSTOMIZE.md**


### Building yast-raspberry_pi
+ New module raspberry_pi was created
+ Move yast-raspberry_pi to a new directory, `mv yast-raspberry_pi ~/git/`
+ Change directory to ~/git/yast-raspberry_pi/
+ Run `rake run` to verify the module works as expected
+ Edit src/lib/y2raspberry_pi/main_module.rb
 + Edit ``#textdomain""`` to `textdomain "raspberry_pi"`
 + 
