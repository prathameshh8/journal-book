@echo off
echo Step 1: Building your Zola site...
zola build

echo Step 2: Going into the public folder...
cd public

echo Step 3: Initializing Git...
git init

echo Step 4: Adding your GitHub repo as remote...
git remote add origin https://github.com/prathameshh8/Journal.git

echo Step 5: Switching to main branch...
git checkout -b main

echo Step 6: Adding and committing files...
git add .
git commit -m "Deploy site to main branch"

echo Step 7: Force pushing to main branch (this will overwrite it)...
git push -f origin main

echo ✅ Deployment complete!
pause