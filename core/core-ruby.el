;;; package --- ruby configs
;;; Commentary:
;;; Contains my ruby configs

;;; Code:


(use-package rbenv
  :config
  (global-rbenv-mode)
  (rbenv-use-corresponding))

(use-package rubocop
  :ensure t
  :defer t
  :init (add-hook 'ruby-mode-hook 'rubocop-mode)
  :config
  (global-flycheck-mode))

(use-package yaml-mode)

(use-package ruby-hash-syntax)

(use-package region-occurrences-highlighter
  :config
  (add-hook 'ruby-mode-hook 'region-occurrences-highlighter-mode))

(setq ruby-insert-encoding-magic-comment nil)


(provide 'core-ruby)

;;; core-ruby.el ends here
