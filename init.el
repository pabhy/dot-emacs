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

;; Define 'config', 'config/modes/' and 'custom' directory constants required
;; for this config.
(defconst CONFIG-DIR (expand-file-name "config/" user-emacs-directory))
(defconst MODES-DIR (expand-file-name "modes/" CONFIG-DIR))
(defconst CUSTOM-DIR (expand-file-name "custom/" user-emacs-directory))

;; Add 'config/' and 'config/modes/' directories to load path.
(add-to-list 'load-path CONFIG-DIR)
(add-to-list 'load-path MODES-DIR)

;; Define a user's config file with a default name and path.
(defvar user-config-file (expand-file-name "user-config.el" CONFIG-DIR)
  "User's custom Emacs config file.")

;; Load core and language agnostic Emacs configs.
(require 'auxiliary)
(require 'constants)
(require 'bootstrap)
(require 'core)
(require 'dev)
(require 'appearance)
(require 'doc-config)
(require 'org-config)

;; If the user config file exists, load it after Emacs editor is setup and
;; ready, before any modes are loaded.
(when (file-exists-p user-config-file)
  (load user-config-file nil 'nomessage))

;; Load mode and language specific configs.
(require 'rust-config)
(require 'flutter-config)
(require 'ledger-config)
(require 'go-config)
(require 'java-config)
(require 'web-config)

(provide 'init)
;;; init.el ends here
