;;; package --- extensions configs
;;; Commentary:
;;; Contains my extensions configs

;;; Code:

(use-package counsel
  :bind
  ("M-x" . counsel-M-x)
  ("C-x C-f" . counsel-find-file))


(use-package counsel-projectile
  :bind
  ("C-p" . counsel-projectile-find-file)
  :config
  (counsel-projectile-mode))


(use-package flycheck
  :config
  (setq flycheck-indication-mode 'right-fringe
      flycheck-check-syntax-automatically '(save mode-enabled)
      flycheck-highlighting-mode 'symbols
      flycheck-disabled-checkers '(emacs-lisp emacs-lisp-checkdoc make)
      flycheck-display-errors-delay 0.5)
  ;; Enable flycheck
  (add-hook 'after-init-hook #'global-flycheck-mode))


(use-package multiple-cursors)


(use-package org
  :config
  (setq org-directory "~/org"
        org-agenda-files (list "work.org"))
  (org-babel-do-load-languages
   'org-babel-load-languages '((ruby . t)))
  :bind
  ("\C-cl" . org-store-link)
  ("\C-ca" . org-agenda))

(use-package org-bullets
  :config
  (setq org-hide-leading-stars t)
  (add-hook 'org-mode-hook
            (lambda ()
              (org-bullets-mode t))))


(use-package projectile
  :config
  (setq projectile-enable-caching t
	projectile-cache-file (expand-file-name "projectile.cache" temp-dir)
	projectile-known-projects-file (expand-file-name "projectile-bookmarks.eld" temp-dir)
	projectile-globally-ignored-files (append '("*.txt" "*.o" "*.so" "*.log") projectile-globally-ignored-files)
	projectile-globally-ignored-directories (append '("tmp") projectile-globally-ignored-files))
  (setq projectile-completion-system 'ivy)
  (projectile-mode))


(use-package smartparens
  :config
  (require 'smartparens-config)
  (smartparens-global-mode)
  (sp-pair "<" ">"))


(use-package windmove
  :bind
  ("C-x <up>" . windmove-up)
  ("C-x <down>" . windmove-down)
  ("C-x <left>" . windmove-left)
  ("C-x <right>" . windmove-right))


(use-package neotree
  :config
  (setq neo-theme 'arrow
        neo-smart-open t
        neo-window-fixed-size nil)
  (setq projectile-switch-project-action 'neotree-projectile-action)
  ;; Disable line numbers for neotree
  (add-hook 'neo-after-create-hook (lambda (&rest _) (display-line-numbers-mode -1))))
;(add-hook 'after-init-hook #'neotree-toggle)

(provide 'core-extensions)

;;; core-extensions.el ends here
