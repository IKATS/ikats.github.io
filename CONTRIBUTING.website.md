This page describes the workflow to follow when you want to update the website.
Please be sure to have read [INSTALL.md](INSTALL.md) before.

It assumes you know :
- how Git works and you also know how to perform some basics git commands.
- how to use `atom` text editor (open file, open folder, save, close)

** For Windows users :**
- how to open a console (black screen temrminal)
- how to use your installation of 'Ruby for windows' (specific console different from the windows one)


# Important rules

- Always be aligned with latest `master` branch.
- `master` represents the *official* website content.
- Always work in `contrib` branch

The git workflow consists in :
- pushing new changes on top of `contrib` branch
- rebasing any conflicting change to have a single proper commit chain (same as SVN)


# Detailed workflow


## Start working for the first time

**For all users having `git` installed and who prefer terminal commands:**
1. Align with the latest `master` branch to not forget some improvements on your local copy of the repository made by others team mates on other branches.
 Commands to do **in the project repository**:
 ```bash
 git checkout master
 git pull
 # Go to contrib branch (and create it with `-b` switch if it doesn't exist)
 git checkout -b contrib
 ```

_Note_ : Windows users having Git installed can also perform the commands above instead of the specific TortoiseGit commands below (which are slower)

**For TortoiseGit users:**
1. Do in the windows explorer in the project folder `ikats_website`
  - Right click on an empty space of the folder (don't select a specific file)
  - Select `TortoiseGit`>`Switch/Checkout`
  - Select the branch named `contrib` in the combo box and validate
  - Right click again on an empty space of the folder (don't select a specific file)
  - Select `TortoiseGit`>`Pull`


## Continue to work

**For all users having `git` installed and who prefer terminal commands:**
2. Go to the `contrib` branch
 ```bash
 # First time, go in the branch
 git checkout contrib

 # Next times, re-align with master
 git checkout contrib
 git rebase master
 ```
  - **TortoiseGit users:** Do in the windows explorer in the project folder `ikats_website`
    - Right click on an empty space of the folder (don't select a specific file)
    - Select `TortoiseGit`>`Rebase`
    - Rebase your `contrib` branch onto `origin/contrib` branch and validate
    - Select `TortoiseGit`>`Rebase`
    - Rebase your `contrib` branch onto `origin/master` branch and validate

3. Open `atom` to the local copy of the repository `ikats_website` (or open repository folder inside `atom` after having started it).

4. Activate the live-reload plugin by pressing `alt+shift+T` or go to the menu `packages`>`Jekyll`>`Toggle server`

 _Note for windows users:_
 If the live-reload doesn't work, please fallback to the low level method:
 In a **ruby** console (**not a standard console**), do the following :
 - Go to the `ikats_website` folder
 - Enter the command `bundle exec jekyll serve --watch --port 3000` to start watching any changes you make in tracked files

5. The website build and served by Jekyll is available at this URL [http://127.0.0.1:3000](http://127.0.0.1:3000) with a recent browser


## Edit the pages

6. Edit the pages you want using `atom`.
7. Save the page with `ctrl+s` (in `atom`, blue bullet on the tab containing page filename disappears once saved)
8. Press `F5` on web browser to refresh the rendered website.


## Push your changes to the repository

This step is one of the most important steps !
This let other people to see/integrate/use the changes you made.

**For all users having `git` installed and who prefer terminal commands:**
9. Do
 ```bash
 git commit -am "description of the change"
 git push
 ```

**In Atom with git packages:**
9. In `atom`:
 - Save all files
 - Right click on the `ikats_website` folder (left panel)
 - Select `git`>`commit all`
 - Add a description about the change
 - Press `Commit & push`
