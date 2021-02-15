;;; package --- web configs
;;; Commentary:
;;; Contains my web configs

;;; Code:

(use-package web-mode
  :config
  (setq web-mode-markup-indent-offset 2
        web-mode-css-indent-offset 2
        web-mode-code-indent-offset 2
	web-mode-enable-current-element-highlight t)
  (setq web-mode-enable-auto-pairing nil)
  (add-hook 'web-mode-hook 'highlight-indentation-current-column-mode)
  (add-hook 'web-mode-hook (lambda () (electric-indent-local-mode -1)))

  (add-to-list 'auto-mode-alist '("\\.js\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode)))


(use-package web-mode
  :ensure t
  :mode (("\\.html?\\'" . web-mode)
         ("\\.tsx\\'" . web-mode)
         ("\\.jsx\\'" . web-mode)))

(eval-after-load "web-mode"
  '(set-face-foreground 'web-mode-current-element-highlight-face "#ff6c6b"))
(eval-after-load "web-mode"
  '(set-face-background 'web-mode-current-element-highlight-face nil))

(provide 'core-web)

;;; core-web ends here
