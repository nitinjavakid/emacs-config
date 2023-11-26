(defun rclone-sync-from ()
  "Sync data from dropbox"
  (interactive)
  (shell-command "rclone sync dropbox:/ ~/dropbox/"))

(defun rclone-sync-to ()
  "Sync data to dropbox"
  (interactive)
  (shell-command "rclone sync ~/dropbox/ dropbox:/"))
