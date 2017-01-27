;; `window-divider-mode' gives us finer control over the border between windows.
;; The native border "consumes" a pixel of the fringe on righter-most splits (in
;; Yamamoto's emacs-mac at least), window-divider does not. You can also control
;; vertical borders between windows (introduced in Emacs 25.1+)
(when (boundp 'window-divider-mode)
  (setq window-divider-default-places t
        window-divider-default-bottom-width 1
        window-divider-default-right-width 1)
  (window-divider-mode +1))

(use-package doom-themes
  :config
  (load-theme 'doom-one t)
  (let ((c '((class color) (min-colors 89)))
      (black          "#181e26")
      (white          "#DFDFDF")
      (blue           "#51afef"))

    (custom-theme-set-faces
     'doom-one
     ;; Doom faces
     `(show-paren-match          ((,c (:foreground ,black :background ,white))))
     ;; Ivy
     `(ivy-current-match         ((,c (:background ,blue))))
     ;; org-mode
     `(org-level-2               ((,c (:foreground ,blue))))
     `(org-level-3               ((,c (:foreground ,white))))
     `(org-level-4               ((,c (:foreground ,white))))
     `(org-level-5               ((,c (:foreground ,white))))
     `(org-level-6               ((,c (:foreground ,white))))))
  (require 'doom-neotree)
  (add-hook 'minibuffer-setup-hook 'doom-brighten-minibuffer)
  (add-hook 'find-file-hook 'doom-buffer-mode))

(use-package git-gutter-fringe)

(use-package git-gutter
  :config
  (require 'git-gutter-fringe)
  (global-git-gutter-mode +1)
  (define-fringe-bitmap 'git-gutter-fr:added
    [224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224]
    nil nil 'center)
  (define-fringe-bitmap 'git-gutter-fr:modified
    [224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224]
    nil nil 'center)
  (define-fringe-bitmap 'git-gutter-fr:deleted
    [0 0 0 0 0 0 0 0 0 0 0 0 0 128 192 224 240 248]
    nil nil 'center)

  (add-hook 'focus-in-hook 'git-gutter:update-all-windows))

(setq fringes-outside-margins t
      highlight-nonselected-windows nil)

(define-fringe-bitmap 'flycheck-fringe-bitmap-double-arrow
  [0 0 0 0 0 4 12 28 60 124 252 124 60 28 12 4 0 0 0 0])

;; Custom line number stuff
(set-face-attribute 'fringe nil)
(set-face-foreground 'linum-highlight-face "#00B3EF")
(set-face-background 'linum-highlight-face "#1f252b")

(use-package fill-column-indicator
  :config
  (define-globalized-minor-mode my-global-fci-mode fci-mode turn-on-fci-mode)
  (my-global-fci-mode 1))
(setq fci-rule-width 1)
(setq fci-rule-color "darkgray")
(setq-default fci-rule-column 80)


(use-package highlight-indentation
  :config
  (add-hook 'ruby-mode-hook
	    (lambda () (highlight-indentation-mode)))
  (add-hook 'web-mode-hook
	    (lambda () (highlight-indentation-current-column-mode)))
  (set-face-background 'highlight-indentation-face "grey26")
  (set-face-background 'highlight-indentation-current-column-face "grey30"))


(set-face-foreground 'show-paren-match "#ff6c6b")
(set-face-background 'show-paren-match nil)

(eval-after-load "web-mode"
  '(set-face-foreground 'web-mode-current-element-highlight-face "#ff6c6b"))
(eval-after-load "web-mode"
  '(set-face-background 'web-mode-current-element-highlight-face nil))


(provide 'core-ui)
