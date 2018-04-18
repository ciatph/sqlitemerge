::----------------------------------------------------------
:: Add sqlite databases for processing: 
:: - pull the CIAT (5) devices sqlite database files into
::   the /databases directory from the remote repository
::   https://ciatph@bitbucket.org/ciatph/data.git 
:: angel;20180417
::----------------------------------------------------------

:: Delete the remote externals url, if any
git remote rm databases

:: Delete the HEAD local /databases directory 
git rm -r databases
timeout /t 3

:: Forcibly delete the untracked /databases directory
rmdir /S databases

::git commit -m "Removed local /databases."
::timeout /t 3

:: Add the remote /databases repository
git remote add -f databases https://ciatph@bitbucket.org/ciatph/data.git
timeout /t 3

:: git merge -s ours --no-commit --allow-unrelated-histories databases/master
:: timeout /t 3

:: Create and fill the new local /databases directory
git read-tree --prefix=databases/ -u databases/master
timeout /t 3

::git commit -m "Merged with subtree /databases from BitBucket."
::timeout /t 3

:: restore GitHub HEAD /databases
git reset HEAD databases