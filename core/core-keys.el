;;; package --- ui configs
;;; Commentary:

;; Set global keybindings

;;; Code:

;; navigate in buffers
(global-set-key [C-iso-lefttab] 'previous-buffer)
(global-set-key [C-S-tab] 'previous-buffer)
(global-set-key [C-tab] 'next-buffer)


;; personal shortcuts
(global-set-key (kbd "C-S-x") 'kill-region)
(global-set-key (kbd "C-S-v") 'yank)
(global-set-key (kbd "C-S-c") 'kill-ring-save)
(global-set-key (kbd "C-s") 'save-buffer)
(global-set-key (kbd "C-a") 'mark-whole-buffer)
(global-set-key (kbd "C-w") 'kill-buffer)
(global-set-key (kbd "C-;") 'comment-or-uncomment-region)
(global-set-key (kbd "C-z") 'undo)

(global-set-key (kbd "C-c s") 'yas-insert-snippet)

(global-set-key (kbd "C-f") 'swiper)
(global-set-key (kbd "C-S-f") 'zrgrep)

(global-set-key (kbd "M-<up>") 'move-text-up)
(global-set-key (kbd "M-<down>") 'move-text-down)

(global-set-key (kbd "<home>") 'beginning-of-line)
(global-set-key (kbd "<end>") 'end-of-line)
(global-set-key (kbd "M-<home>") 'beginning-of-buffer)
(global-set-key (kbd "M-<end>") 'end-of-buffer)

(global-set-key (kbd "M-S-<up>") 'mc/mark-previous-like-this)
(global-set-key (kbd "M-S-<down>") 'mc/mark-next-like-this)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

(global-set-key (kbd "C-\\") 'neotree-project-root-dir-or-current-dir)
(global-set-key (kbd "C-\º") 'neotree-project-root-dir-or-current-dir)
(global-set-key (kbd "C-x C-b") 'counsel-switch-buffer)

(global-set-key (kbd "C-SPC") 'company-complete)

;; Magit & git-gutter
(global-set-key (kbd "C-x g s") 'magit-status)
(global-set-key (kbd "C-x g a") 'magit-stage)
(global-set-key (kbd "C-x g c h") 'magit-checkout)
(global-set-key (kbd "C-x g c m m") 'magit-commit)
(global-set-key (kbd "C-x g c m a") 'magit-commit-amend)
(global-set-key (kbd "C-x g l") 'magit-log)
(global-set-key (kbd "C-x g p l") 'magit-pull)
(global-set-key (kbd "C-x g p s") 'magit-push)
(global-set-key (kbd "C-x g t a") 'magit-stash)
(global-set-key (kbd "C-x g t p") 'magit-stash-pop)
(global-set-key (kbd "C-x g t l") 'magit-stash-list)

(global-set-key (kbd "C-x g d") 'git-gutter:popup-diff) ;; Diff at point
(global-set-key (kbd "C-x g +") 'git-gutter:do-stage-hunk) ;; Stage the change at point
(global-set-key (kbd "C-x g -") 'git-gutter:do-revert-hunk) ;; Revert the change at point


(provide 'core-keys)

;;; core-keys.el ends here
