(when (boundp 'plantuml-jar-path)
  (use-package plantuml-mode
    :init
    :ensure t
    :config
    (setq org-plantuml-jar-path plantuml-jar-path)
    (setq plantuml-default-exec-mode 'jar)
    (add-hook 'plantuml-mode-hook
              (lambda ()
                (setq (make-local-variable 'company-backends) '(company-dabbrev-code))
                ))
    (add-to-list 'org-src-lang-modes '("plantuml" . plantuml))
    )
  (use-package flycheck-plantuml
    :init
    :ensure t
    :config
    (flycheck-plantuml-setup))
  )
