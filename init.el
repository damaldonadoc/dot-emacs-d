;;; package --- Main init file
;;; Commentary:
;;; This is my init file

;;; Code:

(package-initialize)

(add-to-list 'load-path (concat user-emacs-directory "core"))

(require 'core)
(require 'core-extensions)
(require 'core-functions)
(require 'core-keys)
(require 'core-ui)

(require 'core-ruby)
(require 'core-web)
(require 'core-json)
(require 'core-elixir)
(require 'core-crystal)
(require 'core-ts)
(require 'core-modeline)
