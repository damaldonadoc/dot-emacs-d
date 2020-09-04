;;; package --- elixir configs
;;; Commentary:
;;; Contains my elixir configs

;;; Code:

(use-package alchemist
  :config
  (add-hook 'after-init-hook 'global-company-mode))


(eval-after-load "elixir-mode"
  '(defun elixir-format--mix-executable ()
     (string-trim-right (shell-command-to-string "asdf which mix"))))

(add-hook 'elixir-mode-hook
          (lambda () (add-hook 'before-save-hook 'elixir-format nil t)))

(use-package elixir-yasnippets)

(provide 'core-elixir)

;;; core-elixir.el ends here
