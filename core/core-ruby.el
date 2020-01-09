;;; package --- ruby configs
;;; Commentary:
;;; Contains my rbuy configs

;;; Code:


(use-package rbenv
  :config
  (global-rbenv-mode)
  (rbenv-use-corresponding))


(use-package rubocop
  :config
  (require 'rubocop)
  (global-flycheck-mode))

(use-package yaml-mode)

(use-package region-occurrences-highlighter
  :config
  (add-hook 'ruby-mode-hook 'region-occurrences-highlighter-mode))

(setq ruby-insert-encoding-magic-comment nil)

(provide 'core-ruby)

;;; core-ruby.el ends here
