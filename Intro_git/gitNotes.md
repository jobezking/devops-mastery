Git installation  
sudo apt install \-y git-all  
sudo yum \-y install git-all  
**git branch**: list, create, or delete branches  
untracked files: files that git is aware of but does not know what to do with yet  
git areas: working area, staging area, committed files

Initialize git repo:

1. Go to project folder cd /home/user/project  
2. **git config**:   
   1. **git config [user.name](http://user.name) “My Name”** (sets name)  
   2. **git config user.email “[my.name@mail.com](mailto:my.name@mail.com)”** (sets email)  
3. **git init** (initiialize repo)  
4. ls \-a (to show /home/user/project/.git)  
5. touch story1.txt && echo “This is a great story” \>\> story1.txt  
6. **git status** (will show story1.txt as untracked, hence in working area)  
7. **git add story1.txt** (adds story1 to staging)  
8. To unstage: **git rm –cached story1.txt**  
9. To delete: **git rm \-f story.txt**  
10. **git commit \-m “Added first story” story.txt** (commits to local git repository)  
    1. Local git repository is /home/user/project/.git   
    2. Saves file in current state  
11. Can reset this project to this exact state at any point in the future  
12. Modify story1.txt and it goes back to working area  
    1. However, story1.txt is modified state, not untracted  
    2. **git add story1.txt** will stage updates to tracked file  
    3. **git restore story.txt**: revert changes in working dir from .git version  
    4. git restore cleans story.txt from working area  
    5. **git commit \-m “Updated”** (see 9.)  
13. Best practice: every commit should address a single issue  
14. echo “do\_not\_track.txt” \>\> .gitignore  
15. **git log** (to show git log file)  
    1. **git log –oneline** (shows first line)  
    2. **git log –name-only** (shows name of coder and files added)  
16. **git show** (similar to git log)  
17. **git reset** (undoes changes made since last commit)  
18. **git push** (sends committed files to remote repository)

Branch: pointer to the last commit  
**git checkout \-b newbr**: creates new branch with the name newbr and switch to newbr  
**git branch**: shows all branches as well as current branch. Have to be in right folder  
**git branch newbr**: creates new branch with the name newbr  
**git checkout oldbr**: switch to existing branch  
**git branch \-d newbr:** deletes branch newbr  
**git log \--graph \--decorate:** see previous commit history and branches commits were made on  
HEAD: branch where you are right now in repo. Points to last commit in current branch. When you switch branches, the head movies with you.

To merge feature branch into master:

1. **git checkout master** (switch to master branch)  
2. **git merge featureb** (merges featureb with master)

Two merge types:

1. fast-forward: when current branch has no extra commits compared to branch being merged. Doesn’t create new commit but merges commits on branch being merged (featureb) into current branch (master). Only possible if current branch has no outstanding commits  
2. no-fast-forward: when current branch has commits. Git creates a merging commit on active branch. Resulting parent commit points to active branch and branch being merged. The result is all commits on both branches being merged. 

Remote repositories  
Connection string: https://github.com/kodecloudhub/stories.git

1. **git remote add origin [https://github.com/kodecloudhub/stories.git](https://github.com/kodecloudhub/stories.git)**  initialize remote repository. Do it from root directory of local repository on local host. The remote repo account \- kodecloudhub \- and name \- stories \- must match  
2. **git remote \-v**: list all remote repositories  
3. git push \[alias\] \[branch\]: updates remote repository branch i.e. **git push origin master**  
4. **git clone \[ssh link\]**: clones remote repository. Can also use https link or gh repo clone  
5. After cloning repo **git log** will contain the entire project history  
6. git fetch \[alias\] \[branch\]: update local repo with remote changes ie. **git fetch origin master**  
7. git merge \[alias\] / \[branch\]: merge remote master with local master i.e **git merge origin/master**  
8. git pull \[alias\] / \[branch\]: combines fetch and merge i.e.  **get pull origin master**  
9. **git branch \-a**: views all local and remote branches  
10. To fork: [https://www.youtube.com/watch?v=8lGpZkjnkt4](https://www.youtube.com/watch?v=8lGpZkjnkt4) 