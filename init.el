(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("melpa-stable" . "https://stable.melpa.org/packages/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))
(package-initialize)

;; setup.el provides a macro for configuration patterns
;; it makes package installation and config nice and tidy!
;; https://www.emacswiki.org/emacs/SetupEl
(if (package-installed-p 'setup)
    nil
  (if (memq 'setup package-archive-contents)
      nil
    (package-refresh-contents))
  (package-install 'setup))

(if (package-installed-p 'use-package)
    nil
  (if (memq 'use-package package-archive-contents)
      nil
    (package-refresh-contents))
  (package-install 'use-package))

(require 'setup)
(require 'use-package)


(add-to-list 'load-path "~/.emacs.d/customizations")

(defvar addons
  '("setup-completion.el"
    "setup-rclone.el"
    "setup-org.el"
    "setup-editing.el"
    "setup-ui.el"
    "setup-navigation.el"
    "setup-http-server.el"))

(dolist (x addons)
  (load x))

(setq custom-file (concat user-emacs-directory "custom.el"))
(load custom-file 'noerror)

