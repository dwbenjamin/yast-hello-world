# YaST How to build a new module, Part 1
## This is a simple guide for non-developers
+ Part 1 -- This document
+ Part 2 -- TEAM-DEV.md
+ Part 3 -- OBS.md


### Prerequisites
**openSUSE**  
Tested with **openSUSE Leap 15.1**


**Create your development environment**
+ Setup development environment, [see the source here](https://yastgithubio.readthedocs.io/en/latest/development/)
  1. `sudo zypper install -t pattern devel_yast`
  2. `sudo zypper install ruby-devel aspell-devel aspell-en \`  
  `ruby2.5-rubygem-gettext`
  3. `sudo gem install raspell rubocop-yast`
  3. Verify rubocop
    - `rubocop -V` If this fails create a link
    - `sudo ln -s /usr/bin/rubocop.ruby2.5 /usr/bin/rubocop` (Optional)
    - `rubocop -V` Should now succeed


**Clone GitHub repo**  
1. `mkdir git` (Optional)
2. `cd git` (Optional)
2. `git clone https://github.com/dwbenjamin/yast-hello-world.git`
3. `cd yast-hello-world`
4. `rake run`


**Explore rake**
- `rake -T`
- `rake check:doc` Now there is documentation in the doc/autodocs folder.

Next read the **TEAM-DEV.md** document if you want to setup GitHub.
