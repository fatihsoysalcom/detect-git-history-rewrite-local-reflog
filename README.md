# detect-git-history-rewrite-local-reflog
This example demonstrates how to detect rewritten Git history in a local repository using `git reflog`. It initializes a Git repository, creates a series of commits, then simulates a history rewrite by performing a hard reset to an earlier commit and adding new commits. The script then uses `git reflog` to show how the original history, even though
