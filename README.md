This is emacs repository for setting up workflow similar to mine

You can modify init.el to uncomment languages that you want to enable.
This allows you to setup emacs even on very lightweight computing devices
as well.

# Configuration

## RClone

This can be used to org sync files between different remote backends.

```
(setq rclone-remote-directory "dropbox:/")
(setq rclone-local-directory "~/dropbox/")
```

This allows you to sync files from dropbox configuration on rclone into a local directory using rclone-sync-from command. You can sync local directory to remote using rclone-sync-to command.
