# Detect Git History Rewrite Local Reflog

This example demonstrates how to detect rewritten Git history in a local repository using `git reflog`. It initializes a Git repository, creates a series of commits, then simulates a history rewrite by performing a hard reset to an earlier commit and adding new commits. The script then uses `git reflog` to show how the original history, even though no longer part of the active branch, is still recorded and traceable, illustrating how to audit local history changes without a central server.

## Language

`bash`

## How to Run

1. Ensure Git is installed on your system.
2. Save the code as `detect_history_rewrite.sh`.
3. Run the script from your terminal: `bash detect_history_rewrite.sh`

## Original Article

This example accompanies the Turkish article: [Git Sunucusu Olmadan Force-Push ve Yeniden Yazılan Tarihçeyi Denetleme: Yerel Depoların Gizemli Dünyası](https://fatihsoysal.com/blog/git-sunucusu-olmadan-force-push-ve-yeniden-yazilan-tarihceyi-denetleme-yerel-depolarin-gizemli-dunyasi/).

## License

MIT — see [LICENSE](LICENSE).
