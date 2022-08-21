;;; init.el --- Loads Emacs config -*- lexical-binding: t -*-

;; Author: Pratik Abhyankar
;; Maintainer: Pratik Abhyankar
;; Version: version
;; Package-Requires: (dependencies)
;; Homepage: homepage
;; Keywords: init, init.el, load, config, .emacs, .emacs.d, dot-emacs

;;; Commentary:
;; Entry point to Emacs config which loads all diffrent packages, modes and
;; their configs from the 'config/' directory. Executed after 'early-init.el'
;; has been loaded.


;;; Code:

;; Add 'config/' and 'config/modes/' directories to load path.
(defconst CONFIG-DIR (expand-file-name "config/" user-emacs-directory))
(defconst MODES-DIR (expand-file-name "modes/" CONFIG-DIR))
(add-to-list 'load-path CONFIG-DIR)
(add-to-list 'load-path MODES-DIR)

;; Load core and language agnostic Emacs configs.
(require 'constants)
(require 'bootstrap)
(require 'appearance)
(require 'core)
(require 'dev)
(require 'doc-config)
(require 'org-config)
(require 'auxiliary)

;; Load mode and language specific configs.
(require 'rust-config)
(require 'flutter-config)
(require 'ledger-config)
(require 'go-config)
(require 'java-config)
(require 'web-config)

(provide 'init)
;;; init.el ends here.
