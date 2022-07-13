;;; java-config.el -- Loads Java Config in Emacs

;;; Commentary:
;; Created On: 12 July 2022
;; Author: Pratik Abhyankar

;;; Code:
(use-package lsp-java
	:hook (java-mode . lsp-deferred))

;; (use-package dap-java
;; 	:after lsp-java
;; 	:bind (("<f7>" . dap-step-in)
;; 				 ("<f8>" . dap-next)
;; 				 ("<f9>" . dap-continue)))

(provide 'java-config)
;;; java-config.el ends here
