#!/usr/bin/env bash


scalafmt

git diff --quiet
formatted=$?

echo "* Properly formatted?"

if [ $formatted -eq 0 ]; then
   echo "* Yes"
else
   echo "* No"
   echo "The following files need formatting (in stage or commited):"
   git diff --name-only
   echo ""
   echo "Please run 'scalafmt' to format the code."
   echo ""
fi

git stash --keep-index >/dev/null
git stash drop >/dev/null
