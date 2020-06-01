# YaST How to build a new module, Part 4
## This is a simple guide for non-developers
+ Part 1 -- START-HERE.md
+ Part 2 -- TEAM-DEV.md
+ Part 3 -- OBS.md
+ Part 4 -- This document


### Prerequisites
See Part 1 -- START-HERE.md


### Create a new module
+ Change directory to the yast-hello-world cloned in START-HERE.md, Clone GitHub repo, Step 4
+ `rake new_module:create`
+ Enter a name for the new module
  + Use lower case, for example "testing"
  + Do not use special characters
  + Do not use spaces
+ `mv yast-<your module name> ../`
+ `cd ../yast-<your module name>/`
+ `rake run` You should have a new fully functioning YaST module.


### Edit the new_module
+ Use your favorite editor to change the `src/lib/y2<your module name>/main_module.rb`
