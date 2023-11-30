(defun rclone-sync-from ()
  "Sync data from dropbox"
  (interactive)
  (if (and (boundp 'rclone-remote-dir) (boundp 'rclone-local-dir))
      (shell-command (concat "rclone sync " rclone-remote-dir " " rclone-local-dir))
    (error "rclone-remote-dir or rclone-local-dir not defined")))

(defun rclone-sync-to ()
  "Sync data to dropbox"
  (interactive)
  (if (and (boundp 'rclone-remote-dir) (boundp 'rclone-local-dir))
      (shell-command (concat "rclone sync " rclone-local-dir " " rclone-remote-dir))
    (error "rclone-remote-dir or rclone-local-dir not defined")))
