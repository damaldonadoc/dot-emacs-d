
;;; package --- ui configs
;;; Commentary:
;;; Contains my ui configs

;;; Code:

(use-package all-the-icons)

;; doom theme
(use-package doom-themes
  :init
  (load-theme 'doom-one t)
  :config
  (doom-themes-neotree-config)

  (setq
   doom-themes-enable-bold t
   doom-themes-enable-italic t
   doom-themes-neotree-file-icons t))


;; High Light Current Line
(global-hl-line-mode t)


;; git-gutter
(use-package git-gutter
  :config
  (global-git-gutter-mode +1)
  (set-face-foreground 'git-gutter:modified "orange")
  (custom-set-variables
   '(git-gutter:added-sign "❙")
   '(git-gutter:modified-sign "❙")
   '(git-gutter:deleted-sign "𝅍"))
  (add-hook 'window-configuration-change-hook #'git-gutter:update-all-windows))


(define-fringe-bitmap 'flycheck-fringe-bitmap-double-arrow
  [0 0 0 0 0 4 12 28 60 124 252 124 60 28 12 4 0 0 0 0])


;; line numbers
(global-display-line-numbers-mode t)
(set-face-attribute 'line-number-current-line nil
                    :foreground "#00B3EF" :background "#1f252b")


;; column indicator
(global-display-fill-column-indicator-mode t)
(setq-default fill-column 80)


(use-package highlight-indentation
  :config
  (set-face-background 'highlight-indentation-face "grey26")
  (set-face-background 'highlight-indentation-current-column-face "grey30"))


;; parens match config
(show-paren-mode 1)
(set-face-foreground 'show-paren-match "#ff6c6b")
(set-face-background 'show-paren-match nil)

(provide 'core-ui)

;;; core-ui.el ends here
