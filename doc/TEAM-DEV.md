# YaST How to build a new module, Part 2
## This is a simple guide for non-developers
+ Part 1 -- START-HERE.md
+ Part 2 -- This document
+ Part 3 -- OBS.md


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
