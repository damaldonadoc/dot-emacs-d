;;; package --- core configs
;;; Commentary:
;;; Contains my core configs

;;; Code:

(add-to-list 'package-archives (cons "melpa" "https://melpa.org/packages/") t)

(add-to-list 'load-path "~/.emacs.d/vendor/")

(when (not package-archive-contents)
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(setq use-package-always-ensure t)


(defconst private-dir  (expand-file-name "private" user-emacs-directory))
(defconst temp-dir
  (format "%s/cache" private-dir)
  "Hostname-based elisp temp directories.")

;; UTF-8 please
(set-charset-priority 'unicode)
(setq locale-coding-system   'utf-8)   ; pretty
(set-terminal-coding-system  'utf-8)   ; pretty
(set-keyboard-coding-system  'utf-8)   ; pretty
(set-selection-coding-system 'utf-8)   ; please
(prefer-coding-system        'utf-8)   ; with sugar on top
(setq default-process-coding-system '(utf-8-unix . utf-8-unix))

;;; Prevent Extraneous Tabs
(setq-default indent-tabs-mode nil)

(fset 'yes-or-no-p 'y-or-n-p)
(global-auto-revert-mode t)

(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

(setq
 confirm-kill-emacs 'y-or-n-p
 confirm-nonexistent-file-or-buffer  t
 save-interprogram-paste-before-kill t
 require-final-newline               t
 visible-bell                       nil
 ring-bell-function                 'ignore
 ;; http://ergoemacs.org/emacs/emacs_stop_cursor_enter_prompt.html
 minibuffer-prompt-properties
 '(read-only t point-entered minibuffer-avoid-prompt face minibuffer-prompt)
 ;; Disable backups
 backup-inhibited                   t
 history-length                     1000
 auto-save-default                  nil
 auto-save-list-file-name           (concat temp-dir "/autosave")
 make-backup-files                  nil
 create-lockfiles                   nil
 backup-directory-alist            `((".*" . ,(concat temp-dir "/backup/")))
 auto-save-file-name-transforms    `((".*" ,(concat temp-dir "/auto-save-list/") t))
 ;; Disable non selected window highlight
 cursor-in-non-selected-windows     nil
 highlight-nonselected-windows      nil
 ;; PATH
 exec-path                          (append exec-path '("/usr/local/bin/"))
 inhibit-startup-message            t
 fringes-outside-margins            t
 select-enable-clipboard            t
 vc-follow-symlinks                 t
 frame-resize-pixelwise             t)

;; replace text on writing or yank (paste)
(delete-selection-mode t)


;; Disable toolbar & menubar
;;(menu-bar-mode -1)
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))
(when (  fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

;; Delete trailing whitespace before save
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; set title to current directory
(setq frame-title-format '((:eval default-directory)))

(setq mac-command-modifier 'control)
(set-face-attribute 'default nil :height 140)

;; Always start a new tags list (do not accumulate a list of
;; tags) to keep up with the convention of one TAGS per project.
(setq tags-add-tables nil)

(setq ispell-program-name "aspell")

(provide 'core)

;;; core.el ends here
