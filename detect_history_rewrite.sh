#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

# Create a temporary directory for our Git repository
TEMP_DIR=$(mktemp -d)
echo "Created temporary directory: $TEMP_DIR"
cd "$TEMP_DIR"

# Initialize a new Git repository
git init > /dev/null

# Configure dummy user for commits
git config user.email "test@example.com"
git config user.name "Test User"

echo "\n--- Initializing Git Repository and Creating Original History ---"

# Create initial commits
echo "Initial content" > file.txt
git add file.txt
git commit -m "Commit 1: Initial file"

echo "Line 2" >> file.txt
git add file.txt
git commit -m "Commit 2: Add second line"

echo "Line 3" >> file.txt
git add file.txt
git commit -m "Commit 3: Add third line"

# Display the original commit history
echo "\n--- Original History (before rewrite) ---"
git log --oneline --graph --all
ORIGINAL_HEAD=$(git rev-parse HEAD)
echo "Original HEAD commit: $ORIGINAL_HEAD"

# Display the reflog before any history changes
echo "\n--- Original Reflog (before rewrite) ---"
git reflog

echo "\n--- Simulating History Rewrite (e.g., local 'force-push' scenario) ---"
echo "Resetting HEAD to an earlier commit (Commit 1) and creating new history..."

# Perform a hard reset to an earlier commit (Commit 1), effectively discarding Commit 2 and Commit 3
# This simulates a history rewrite, similar to a force-push that overwrites history.
git reset --hard HEAD~2 > /dev/null

# Create new commits on top of the reset point
echo "New content after reset" > file.txt
git add file.txt
git commit -m "Commit 2 (rewritten): New feature"

echo "Another new line" >> file.txt
git add file.txt
git commit -m "Commit 3 (rewritten): Further development"

# Display the new commit history after the rewrite
echo "\n--- New History (after rewrite) ---"
git log --oneline --graph --all
NEW_HEAD=$(git rev-parse HEAD)
echo "New HEAD commit: $NEW_HEAD"

echo "\n--- Detecting History Rewrite with Git Reflog ---"
# The reflog is crucial for detecting and understanding history changes in local repositories.
# It records every time HEAD or a branch reference was updated.
# Look for 'reset' or 'commit' entries that show the previous state of HEAD.
git reflog

echo "\n--- Reflog Analysis ---"
echo "Notice the 'HEAD@{1}: reset: moving to HEAD~2' entry. This clearly indicates that HEAD was moved."
echo "The entry 'HEAD@{2}: commit: Commit 3: Add third line' shows the SHA of the commit that was previously HEAD."
echo "This mechanism allows you to see the 'old' history even after it has been rewritten or 'force-pushed' locally."
echo "You could use 'git checkout HEAD@{N}' to revert to a previous state if needed."

# Clean up the temporary directory
cd - > /dev/null # Go back to the original directory
rm -rf "$TEMP_DIR"
echo "\n--- Cleaning up ---"
echo "Example finished. Temporary Git repo removed: $TEMP_DIR"
