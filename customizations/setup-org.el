(use-package org-re-reveal
  :init
  :ensure t)

(use-package graphviz-dot-mode
  :init
  :ensure t
  :config
  (add-to-list 'org-src-lang-modes '("dot" . graphviz-dot)))

(use-package gnuplot 
  :init
  :ensure t
  :config
  (org-babel-do-load-languages
                      'org-babel-load-languages
                      '((emacs-lisp . t)
                        (dot . t)
                        (gnuplot . t)
                        (org . t)
                        (python . t))))

(use-package org
  :init
  :ensure t
  :config
  (add-to-list 'org-modules 'org-habit t))

(use-package org-habit-stats
  :init
  :ensure t
  :config
  (setq org-habit-show-habits-only-for-today nil))

(use-package org-download
  :init
  :ensure t
  :config
  (setq org-download-method 'directory)
  (setq org-download-image-dir "./images"))

(add-hook 'org-mode-hook (lambda () (flyspell-mode 1)))
