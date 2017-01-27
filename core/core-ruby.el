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


(provide 'core-ruby)

;;; core-ruby.el ends here
