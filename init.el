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

(setq setup-flags (concat user-emacs-directory "setup-flags.el"))
(load setup-flags 'noerror)

(setq custom-pre-file (concat user-emacs-directory "custom-pre.el"))
(load custom-pre-file 'noerror)

(defvar addons
  '("setup-completion.el"
    "setup-rclone.el"
    "setup-org.el"
    "setup-editing.el"
    "setup-ui.el"
    "setup-navigation.el"
    "setup-git.el"
    "setup-http-server.el"
    "setup-plantuml.el"))

(unless (bound-and-true-p no-setup-markdown)
  (add-to-list 'addons "setup-markdown.el"))

(unless (bound-and-true-p no-setup-golang)
  (add-to-list 'addons "setup-golang.el"))

(unless (bound-and-true-p no-setup-clojure)
  (add-to-list 'addons "setup-clojure.el"))

(dolist (x addons)
  (load x))

(setq custom-post-file (concat user-emacs-directory "custom-post.el"))
(load custom-post-file 'noerror)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(flycheck-plantuml plantuml-mode which-key use-package simple-httpd setup org-re-reveal org-habit-stats org-download magit ivy-rich graphviz-dot-mode gnuplot doom-themes doom-modeline counsel company all-the-icons)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
