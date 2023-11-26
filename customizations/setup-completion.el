(use-package company
  :init
  :ensure t
  :config
  (add-hook 'after-init-hook 'global-company-mode))
