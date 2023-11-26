;; Install following things
;; go install golang.org/x/tools/gopls@latest
;; go install github.com/golangci/golangci-lint/cmd/golangci-lint@v1.55.2
;; pip install semgrep
;; go install github.com/go-delve/delve/cmd/dlv@latest

(use-package go-mode
  :init
  :ensure t
  :config
  (add-hook 'go-mode-hook (lambda() (setq tab-width 4))))

(defun project-find-go-module (dir)
  (when-let ((root (locate-dominating-file dir "go.mod")))
    (cons 'go-module root)))

(cl-defmethod project-root ((project (head go-module)))
  (cdr project))

(use-package project
  :init
  :ensure t
  :config
  (add-hook 'project-find-functions #'project-find-go-module))

(use-package lsp-mode
  :init
  :ensure t
  :hook (go-mode . lsp-deferred))

(use-package yasnippet
  :init
  :ensure t
  :hook (go-mode . yas-minor-mode))

(defun eglot-format-buffer-on-save ()
  (add-hook 'before-save-hook #'eglot-format-buffer -10 t))

(use-package eglot
  :init
  :ensure t
  :hook (go-mode . eglot-ensure) (go-mode . eglot-format-buffer-on-save))

(use-package dap-mode
  :init
  :ensure t
  :config
  (require 'dap-dlv-go))

(use-package vterm
  :init
  :ensure t)
