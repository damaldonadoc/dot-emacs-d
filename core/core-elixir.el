;;; package --- elixir configs
;;; Commentary:
;;; Contains my elixir configs

;;; Code:

(use-package alchemist
  :config
  (add-hook 'after-init-hook 'global-company-mode))

(use-package elixir-yasnippets)

(provide 'core-elixir)

;;; core-elixir.el ends here
