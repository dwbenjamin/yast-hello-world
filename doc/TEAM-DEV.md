# YaST How to build a new module, Part 2
## This is a simple guide for non-developers
<<<<<<< HEAD
+ Part 1 -- START-HERE.md
+ Part 2 -- This document
+ Part 3 -- OBS.md
+ Part 4 -- CUSTOMIZE.md


### Prerequisites
GitHub account

### Setup team development, (Optional)

1. Setup a new repository on GitHub
  + Go to [GitHub](https://github.com/)
  + Log in to your account.
  + Click the [new repository](https://github.com/new) button in the top-right. Set the **Repository name** to __yast-hello-world__. You'll have an option there to initialize the repository with a README file, but don't.
  + Click the **Create repository** button.



2. Setup and push the hello-world module to your git repository.
  + Change to the directory created using **START_HERE.md, Clone GitHub repo,** Step 3.
  + Now add the new repository to the local cloned yast-hello-world repository.
  + `git remote rename origin upstream` This renames the local repository
  + `git remote add origin https://github.com/<YourRepo>/yast-hello-world.git` This sets the local repository to match the new remote repository created above in Step 1.
  + `git push origin master` This synchronizes the local and remote repositories.
=======

### Setup team development, (Optional)

1. Setup infrastructure
  1. [GitHub](https://github.com/) account
  2. Create a new repository on GitHub
    + Go to [GitHub](https://github.com/)
    + Log in to your account.
    + Click the [new repository](https://github.com/new) button in the top-right. Set the **Repository name** to __yast-hello-world__. You'll have an option there to initialize the repository with a README file, but don't.
    + Click the **Create repository** button.
  2. [openSUSE Build Service](https://build.opensuse.org/) account
  3. `osc -A https://api.opensuse.org -c ~/.oscrc`


2. Setup and push the hello-world module to your git repository.
  + Change to the directory created using **START_HERE.md, Clone GitHub repo,** Step 4.
  + Now add the new repository to the local cloned yast-hello-world repository.
  + `git remote rename origin upstream` This renames the local repository
  + `git remote add origin https://github.com/<YourRepo>/yast-hello-world.git` This sets the local repository to match the new remote repository created above in **Setup infrastructure** Step 2.
  + `git push origin master` This synchronizes the local and remote repositories.


3. Setup the Open Build Service for your module.
  + [Log in to your account](https://build.opensuse.org).
  + Click the **Home Project** link in the upper right corner of the page.
  + Click the **Subprojects** link in the tabs.
  + Click the **Create Subproject** link.
  + Set the **Subproject Name:** to yast-hello-world.  Set the Title and Description, if desired.
  + Click the **Accept** button.
>>>>>>> 997e17db94631e942d0ce4d662d236a21bd385be
