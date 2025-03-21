;;; package --- modeline configs
;;; Commentary:
;;; Contains my modeline configs

;;; Code:

(use-package f)
(use-package powerline)

(defun doom/project-root (&optional strict-p)
  "Get the path to the root of your project."
  (let (projectile-require-project-root strict-p)
    (projectile-project-root)))

(defun doom/-flycheck-count (state)
  "Return flycheck information for the given error type STATE."
  (when (flycheck-has-current-errors-p state)
    (if (eq 'running flycheck-last-status-change)
        "?"
      (cdr-safe (assq state (flycheck-count-errors flycheck-current-errors))))))

(defvar mode-line-height 30)
(defvar-local doom--env-version nil)
(defvar-local doom--env-command nil)

(eval-when-compile (require 'powerline))
(defvar mode-line-bar          (pl/percent-xpm mode-line-height 100 0 100 0 3 "#00B3EF" nil))
(defvar mode-line-eldoc-bar    (pl/percent-xpm mode-line-height 100 0 100 0 3 "#B3EF00" nil))
(defvar mode-line-inactive-bar (pl/percent-xpm mode-line-height 100 0 100 0 3 nil nil))

(defface mode-line-is-modified nil "Face for mode-line modified symbol")
(defface mode-line-buffer-path nil "Face for mode-line buffer file path")
(defface mode-line-highlight nil "")
(defface mode-line-2 nil "")

(defvar mode-line-selected-window nil)
(defun doom|set-selected-window (&rest _)
  (let ((window (frame-selected-window)))
    (unless (minibuffer-window-active-p window)
      (setq mode-line-selected-window window))))
(add-hook 'window-configuration-change-hook #'doom|set-selected-window)
(add-hook 'focus-in-hook #'doom|set-selected-window)

(advice-add 'select-window :after 'doom|set-selected-window)
(advice-add 'select-frame  :after 'doom|set-selected-window)


;;
;; Mode-line segments
;;

(defun *buffer-path ()
  (when buffer-file-name
    (propertize
     (f-dirname
      (let ((buffer-path (file-relative-name buffer-file-name (doom/project-root)))
            (max-length (truncate (/ (window-body-width) 1.75))))
        (concat (projectile-project-name) "/"
                (if (> (length buffer-path) max-length)
                    (let ((path (reverse (split-string buffer-path "/" t)))
                          (output ""))
                      (when (and path (equal "" (car path)))
                        (setq path (cdr path)))
                      (while (and path (<= (length output) (- max-length 4)))
                        (setq output (concat (car path) "/" output))
                        (setq path (cdr path)))
                      (when path
                        (setq output (concat "../" output)))
                      (when (string-suffix-p "/" output)
                        (setq output (substring output 0 -1)))
                      output)
                  buffer-path))))
     'face (if active 'mode-line-buffer-path))))

(defun *buffer-state ()
  (when buffer-file-name
    (propertize
     (concat (if (not (file-exists-p buffer-file-name))
                 "∄"
               (if (buffer-modified-p) "✱"))
             (if buffer-read-only ""))
     'face 'mode-line-is-modified)))

(defun *buffer-name ()
  "The buffer's name."
  (s-trim-left (format-mode-line "%b")))

(defun *buffer-pwd ()
  "Displays `default-directory'."
  (propertize
   (concat "[" (abbreviate-file-name default-directory) "]")
   'face 'mode-line-2))

(defun *major-mode ()
  "The major mode, including process, environment and text-scale info."
  (concat (format-mode-line mode-name)
          (if (stringp mode-line-process) mode-line-process)
          (if doom--env-version (concat " " doom--env-version))
          (and (featurep 'face-remap)
               (/= text-scale-mode-amount 0)
               (format " (%+d)" text-scale-mode-amount))))

(defface mode-line-vcs-info '((t (:inherit success)))
"")
(defface mode-line-vcs-warning '((t (:inherit warning)))
"")
(defface mode-line-vcs-error '((t (:inherit error)))
"")
(defun *vc ()
  "Displays the current branch, colored based on its state."
  (when vc-mode
    (let ((backend (concat " " (substring vc-mode (+ 2 (length (symbol-name (vc-backend buffer-file-name)))))))
          (face (let ((state (vc-state buffer-file-name)))
                  (cond
		   ((memq state '(up-to-date))
		    'mode-line-vcs-info)
		   ((memq state '(edited added))
		    'mode-line-vcs-warning)
		   ((memq state '(removed needs-merge needs-update conflict removed unregistered))
		    'mode-line-vcs-error)))))
      (if active
          (propertize backend 'face face)
        backend))))

(defface doom-flycheck-error '((t (:inherit error)))
  "Face for flycheck error feedback in the modeline.")
(defface doom-flycheck-warning '((t (:inherit warning)))
  "Face for flycheck warning feedback in the modeline.")
(defvar-local doom--flycheck-err-cache nil "")
(defvar-local doom--flycheck-cache nil "")
(defun *flycheck ()
  "Persistent and cached flycheck indicators in the mode-line."
  (when (and (featurep 'flycheck)
             flycheck-mode
             (or flycheck-current-errors
                 (eq 'running flycheck-last-status-change)))
    (or (and (or (eq doom--flycheck-err-cache doom--flycheck-cache)
                 (memq flycheck-last-status-change '(running not-checked)))
             doom--flycheck-cache)
        (and (setq doom--flycheck-err-cache flycheck-current-errors)
             (setq doom--flycheck-cache
                   (let ((fe (doom/-flycheck-count 'error))
                         (fw (doom/-flycheck-count 'warning)))
                     (concat
                      (if fe (propertize (format " •%d " fe)
                                         'face (if active
                                                   'doom-flycheck-error
                                                 'mode-line)))
                      (if fw (propertize (format " •%d " fw)
                                         'face (if active
                                                   'doom-flycheck-warning
                                                 'mode-line))))))))))


(defun *buffer-position ()
  "A more vim-like buffer position."
  (let ((start (window-start))
        (end (window-end))
        (pend (point-max)))
    (if (and (= start 1)
             (= end pend))
        ":All"
      (cond ((= start 1) ":Top")
            ((= end pend) ":Bottom")
            (t (format ":%d%%%%" (/ end 0.01 pend)))))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun doom-mode-line (&optional id)
  `(:eval
    (let* ((active (eq (selected-window) mode-line-selected-window))
           (lhs (list (propertize " " 'display (if active mode-line-bar mode-line-inactive-bar))
                      (*flycheck)
                      " "
                      (*buffer-path)
                      (*buffer-name)
                      " "
                      (*buffer-state)
                      ,(if (eq id 'scratch) '(*buffer-pwd))))
           (rhs (list (*vc)
                      "  " (*major-mode) "  "
                      (propertize
                       (concat "(%l,%c) " (*buffer-position))
                       'face (if active 'mode-line-2))))
           (middle (propertize
                    " " 'display `((space :align-to (- (+ right right-fringe right-margin)
                                                       ,(1+ (string-width (format-mode-line rhs)))))))))
      (list lhs middle rhs))))

(setq-default mode-line-format (doom-mode-line))

(provide 'core-modeline)
;;; core-modeline.el ends here
