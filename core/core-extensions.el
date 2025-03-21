;;; package --- extensions configs
;;; Commentary:
;;; Contains my extensions configs

;;; Code:

(use-package counsel
  :ensure t
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

(use-package company
  :ensure t
  :config
  (setq company-show-numbers t)
  (setq company-tooltip-align-annotations t)
  ;; invert the navigation direction if the the completion popup-isearch-match
  ;; is displayed on top (happens near the bottom of windows)
  (setq company-tooltip-flip-when-above t)
  (global-company-mode))


(use-package company-quickhelp
  :ensure t
  :init
  (company-quickhelp-mode 1)
  (use-package pos-tip
    :ensure t))


(use-package projectile
  :config
  (setq projectile-enable-caching nil)
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

(use-package lsp-mode
  :ensure t
  :hook ((before-save . lsp-format-buffer))
  :commands (lsp lsp-deferred)
  :config
  (setq lsp-headerline-breadcrumb-enable nil))

 (use-package lsp-ui
    :ensure t
    :commands lsp-ui-mode)


(use-package magit
  :ensure t)

(provide 'core-extensions)

;;; core-extensions.el ends here
