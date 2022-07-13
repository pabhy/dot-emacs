;;; init.el --- Loads Emacs config -*- lexical-binding: t; -*-

;;; Commentary:
;; Author: Pratik Abhyankar
;; Created: May 29 2022

;;; Code:
(defconst CONFIG-DIR (expand-file-name "config/" user-emacs-directory))
(defconst MODES-DIR (expand-file-name "modes/" CONFIG-DIR))
(add-to-list 'load-path CONFIG-DIR)
(add-to-list 'load-path MODES-DIR)

(require 'constants)
(require 'bootstrap)
(require 'appearance)
(require 'core)
(require 'dev)
(require 'eloquence)
(require 'org-config)
(require 'auxiliary)

(require 'rust-config)
(require 'flutter-config)
(require 'ledger-config)
(require 'go-config)
(require 'java-config)

;;; init.el ends here
