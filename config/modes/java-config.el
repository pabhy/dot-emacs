;;; java-config.el --- Java mode config -*- lexical-binding: t -*-

;; Author: Pratik Abhyankar
;; Maintainer: Pratik Abhyankar
;; Version: 1.0
;; Package-Requires: (dependencies)
;; Homepage: homepage
;; Keywords: java, java-mode, java-config


;;; Commentary:


;;; Code:
(use-package lsp-java
	:init
	(setq lsp-java-server-install-dir (pratik/create-custom-dir "eclipse.jdt.ls/")
				lsp-java-workspace-dir (pratik/create-custom-dir "workspace/"))
	:hook (java-mode . lsp-deferred))

;; (use-package dap-java
;; 	:after lsp-java
;; 	:bind (("<f7>" . dap-step-in)
;; 				 ("<f8>" . dap-next)
;; 				 ("<f9>" . dap-continue)))

(provide 'java-config)
;;; java-config.el ends here.
