# Lesson: Straight forward path for issues:

1. Clone the repository
  - `git clone git@github.ibm.com:zNextCompliance/compliance-git-education.git`

2. Get all changes from the remote repository 
  - `git pull`

3. Use git status to look for your current branch
  - You are on the default branch after cloning, which is on our repositories the main branch. 

4. Create a feature branch
  - `git checkout -b <your short name>/<very short description>`
  - e.g. `git checkout -b timmel/fix_some_issue`

5. Use git status to look for your current branch
  - You are now on your feature branch.

6. Copy the matrix.sh file and rename it with your short name
  - Replace the XXX in the next command with your name
  - e.g.: `cp matrix.sh XXX.sh`
  - Open an editor of your choice and change line number 11 and replace the default chars with you name.

7. Look for changes (see unstaged changes - red files)
  - `git status`

8. Add files to next commit (hint: copy the name from git status)
  - `git add <filename>`
  - `git add *`
  - `git add *.sh`

9. Look for changes and see the difference (green vs red files)
  - `git status`

10. Commit the changes and follow: https://pages.github.ibm.com/zNextCompliance/Playbook.github.ibm.com//development-process/00-overview
  - `git commit -m “<meaningfull commit message>”`
  - git commit hook is enabled in all production compliance repositories.

11. Push the changes to the remote repository on github.ibm.com
  - `git push`
  - for a new feature branch,  `git push --set-upstream origin <your branch>`

12. Create a Pull Request in the Web frontend with a proper description
   - https://github.ibm.com/zNextCompliance/git-education

13. Request a review from a team mate

14. Use built in features to discuss the changes and make suggestions how to fix it
  - You should at least one time reject the changes. 

15. Merge the PR, if you got the review.
16. Checkout main branch (to be prepared for the next lesson)
  - git checkout main 

# Lesson: Reorder multiple commits

One reason why two or more commits would need to be reordered could be that two non-consecutive commits would need to be squashed. Modifications such as this are known are rewriting history.

1. Create a feature branch
  - `git checkout -b <your short name>/reorder_commits`

2. Create a text file
  - `echo commit1 >> reorder.txt`

3. Commit the changes to the branch
  - `git add reorder.txt`
  - git commit -m “<meaningful commit message>”

4. Add and commit further changes
  - `echo commit2 >> reorder.txt`
  - `git add reorder.txt`
  - `git commit -m “<meaningful commit message>”`
  - `echo commit3 >> reorder.txt`
  - `git add reorder.txt`
  - `git commit -m “<meaningful commit message>”`

5. Proceed to rebasing the branch
  - `git rebase -i HEAD~3`

6. Then an editor will open, with instructions in the comments as to how to edit the commits. The first 3 lines will look like this:
  - `pick <commit-id> <commit-message-1>`
  - `pick <commit-id> <commit-message-2>`
  - `pick <commit-id> <commit-message-3>`

7. Place the 3rd commit between the 1st and the 2nd:
  - `pick <commit-id> <commit-message-1>`
  - `pick <commit-id> <commit-message-3>`
  - `pick <commit-id> <commit-message-2>`
  
8. In order to squash the now second commit to the first modify the second line:
  - `pick <commit-id> <commit-message-1>`
  - `squash <commit-id> <commit-message-3>`
  - `pick <commit-id> <commit-message-2>`

9. Close the file, saving the changes. The commits, have now been reordered and the previously 3rd commit was merged into the 1st.
10. Checkout main branch (to be prepared for the next lesson)
  - `git checkout main`

# Lesson: Squash multiple commits

1. Create a feature branch
  - `git checkout -b <your short name>/squash_commits`

2. Modify the file from previous lesson 
  - `echo squash1 >> XXX.sh`

3. Add the file to staging area
  - `git add XXX.sh`

4. Commit the changes 
  - `git commit -m “<meaningful commit message>”`

5. Repeat steps 2-4 2 times

6. Use git log to see the git log and see all 3 commits
  - `git log`

7. You should not merge such changes in the main branch, squash the commits locally before push.
  - `git reset --soft HEAD~3`
  - OPTIONAL HINT: If this looks strange or more files are in the changed than expected, look at the `git log` for `HEAD` and copy the commit hash to clipboard
  - OPTIONAL HINT: You can execute `git reset --soft <commit hash> to have excatly that HEAD of the main branch.
  - ![image](https://media.github.ibm.com/user/20278/files/21f66d43-3b6a-4710-9fce-a5b5217e2b23)
  - `git add --all`
  - `git commit -m “<meaningful commit message>“`
  - `git push --force`

8. Look at the commit history
  - `git log and see only 1 commit`

9. Use the Web front end to create a PR and look for the changed commit message.

10. If you want, merge the changes after review.

# Lesson: Rebase if the main branch changed in between easy merge (no conflicts)

1. Start on main branch 
  - `git checkout main`
  - `git pull`

2. Delete branches locally to avoid errors, if you reuse the feature branch names
  - `git branch -D <your short name>/feature1`
  - `git branch -D <your short name>/feature2`  
  
3. Create a feature branch 
  - `git checkout -b <your short name>/feature1`

4. Add a comment to the file from the previous lesson
  - `echo #rebase feature1 >> XXX_feature1.sh`

5. Add the file and commit it 
  - `git add XXX_feature1.sh`
  - `git commit -m “test: First feature for git education“`

6. Switch back to main and create a second feature branch
  - `git checkout main` 
  - `git checkout -b <your short name>/feature2`

7. Made some changes in a different file
  - e.g. copy the file: `cp XXX.sh XXX_feature2.sh`

8. Add/commit/Merge the changes in to main branch
  - `git add XXX_feature2.sh`
  - `git commit -m “test: Second feature for git education“`
  - `git push`
  - create a pull request and merge your changes to main 

9. Switch to the first branch which points to an old commit
  - `git checkout <your short name>/feature1`
  - look into the file system (the second file is gone)

10. Pull latest changes to merge the lastest main branch
  - `git pull`

11. Merge the changes into the second feature branch

12. Push the changes on the second branch if you like.

13. Check commit messages !

# Lesson: Rebase if the main branch changed in between complicated merge (merge conflicts)

1. Delete branches locally to avoid errors, if you reuse the feature branch names
  - `git branch -D <your short name>/feature1`
  - `git branch -D <your short name>/feature2`

2. Use the same steps from previous lesson, but on step 5 use the same file and don’t create a new one. Both feature branches made changes in the same file. 

3. During git pull on Step 9 

4. may be you have to set the orgin 
  - `git branch --set-upstream-to=origin/main timmel/feature1`

5. You will see the following message: 
   You have divergent branches and need to specify how to reconcile them.

6. Activate rebase
  - `git config pull.rebase true`

7. Start merge again
  - `git pull`

8. You got the message:
  - Auto-merging XXX.sh
  - `CONFLICT (add/add): Merge conflict in matrix.sh`

9. Lock at git status 
  - `git status`

10. Open an editor of your choice and look for the conflict-resolution markers `(>>>>,<<<<,=====)` and remove all of them. 
  - Hint: you can use git mergetool to merge the changes

11. Save the file

12. Add the file to staging to save the merge 
  - `git add XXX.sh`

13. Check the status (your merge is not done !)
  - `git status`

14. Continue merging
  - `git rebase --continue`

15. You got a vi editor with a merge message

16. Merge is done 

17. Optional:
 - push to main and merge the Pull request.

# Git mergetool:

I prefere meld over opendiff, vimdiff,  bc, emerge, kdiff3 …..

- `brew install meld`
- `git mergetool --tool=meld XXX.sh`
  
![image](https://media.github.ibm.com/user/20278/files/4a755320-d54c-4817-9ed3-3c1366cfaffe)


# Lesson: Review Code on the WebUI

1. Create a pull request with some lines and set a team mate as reviewer.
2. Multiline comment, click on “+” and drag the mouse down to select more than one line.
  ![image](https://media.github.ibm.com/user/20278/files/34971b72-3cb2-46c3-b2ff-42cbaec992b7)
3. Use suggestions to propose code changes. +- icon
  ![image](https://media.github.ibm.com/user/20278/files/fa317b95-41d4-48f0-8928-61a26334813f)


# Ressources: 

- https://git-scm.com/book/en/v2/GitHub-Contributing-to-a-Project
- https://pages.github.ibm.com/zNextCompliance/Playbook.github.ibm.com//development-process/code-review-process
- https://www.dennisrobinson.name/blog/reorder-commits-with-git/

# Ideas:

- ohmyzsh extension: https://ohmyz.sh/ -> Thomas life Demo
- Clipboard history CopyClip install it from Apple appstore
- WebUI: Show all Pull Requests 
- Use Draft Pull Requests for Pull Requests you don’t want a review by now.
- Good practise: Close unused git artefacts like PR and branches. 
- Rebase and Merge is disabled → you have to rebase again

# Summary and Outlook:

Are there any other git related questions we should cover in a separate session ?
