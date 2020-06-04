# YaST How to build a new module, Part 3
## This is a simple guide for non-developers
+ Part 1 -- START-HERE.md
+ Part 2 -- TEAM-DEV.md
+ Part 3 -- This document
+ Part 4 -- CUSTOMIZE.md
+ Part 5 -- NEW_TODO.md

### Prerequisites
Open Build Service account

### Setup OBS, (Optional)
1. `osc -A https://api.opensuse.org -c ~/.oscrc`
3. Setup the Open Build Service for your module.
  + [Log in to your account](https://build.opensuse.org).
  + Click the **Home Project** link in the upper right corner of the page.
  + Click the **Subprojects** link in the tabs.
  + Click the **Create Subproject** link.
  + Set the **Subproject Name:** to yast-hello-world.  Set the Title and Description, if desired.
  + Click the **Accept** button.

### Generate file for OBS


1. Change to the directory created using **START_HERE.md, Clone GitHub repo**, Step 3.
4. Run `rake tarball` this creates a file in the **packages** directory named "yast2-hello-world-0.0.0.tar.bz2".


### Upload files to OBS
1. In the subproject **yast-hello-world** click the **Create Package** link.
 + Set the **Name** to "yast-hello-world"
 + Enter "YaST Hello World" in the **Title** field.
2. Click the **Add file** link under Source files
 + Click the **Browse** button
 + Select the file in the packages directory named "yast2-hello-world-0.0.0.tar.bz"
 + Click the **Save** button
3. Click the **Add file** link again
 + Click the **Browse** button
 + Select the file in the packages directory named "yast2-hello-world.spec"
 + Click the **Save** button


### Set the Build Targets
1. Click the __build targets__ link under the "Build Results" tab.
 + It's part of "The project this package belongs to currently has no **build targets** defined." message.
2. Put a check in the box next to **openSUSE Leap 15.1**
3. Click the "Overview" tab.


The build should be scheduled and/or building.  After a minute or two you will have a successfully build rpm package of the yast-hello-world module.
