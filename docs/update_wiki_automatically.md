# Updating Wiki with docs files automatically on every push

1. create workflow and specify when it should dispatch
2. create a job
3. list the steps

## creating workflow
Firstly, you should name the workflow, and specify with `on` when it is dispatched. In our case, whenever you push something on the main branch the action will activate.
```
name: Update Wiki

on:
  workflow_dispatch:
  push:
    branches:
      - main
```
## create a job
Normally when you create a workflow there are list of jobs needed, but in our case, as the code is simple, only one was enough. Also `deploy` is necessary to deploy your code to a production or staging environment. We need to add operating system, for that we use `runs-on`.
```
jobs:
  deploy:
    runs-on: ubuntu-latest
``` 

## steps
We need to clone 2 repos, copy docs folder from our repo to wiki, commit and push changes. Now discussing each step in the list below.

1. first step is to clone the repo we work in and because of that we have all the information needed so we don't use `with`.
```
      - name: Clone Repo
        uses: actions/checkout@v3
```
2. now we need to clone wiki repo. Extra information is needed, but as we only need to add folder, repository and ssh-key will be enough. also `path` is used to clone repo in that folder.
```
      - name: Clone Wiki Repo
        uses: actions/checkout@v3
        with: 
          repository: 'ntatrishvili/minecraft_server.wiki'
          token: ${{ github.token }}
          ssh-key: '${{ secrets.LUKA_KIU_PC_64X }}'
          persist-credentials: true
          path: wiki
```
3. simple step, coping docs
```
      - name: Copy docs
        run: cp -r ./docs/* ./wiki
```
4. to commit-files, we need to know in what directory we work in and for both `git config --local` input is default. In the commit message we use `$(date +'%Y-%m-%dT%H:%M:%S')`, which shows when the commit was made.
```
      - name: Commit files
        working-directory: ./wiki
        run: |
          git config --local user.email "github-actions[bot]@users.noreply.github.com"
          git config --local user.name "github-actions[bot]"
          git add .
          git commit -a -m "last updated $(date +'%Y-%m-%dT%H:%M:%S')"
```  
5. now the last step, pushing changes. We use already created action on github `ad-m/github-push-action@master`. specify repo, directory and branch.
```
      - name: Push changes
        uses: ad-m/github-push-action@master
        with:
          repository: 'ntatrishvili/minecraft_server.wiki'
          directory: ./wiki
          ssh: true
          branch: master
```



