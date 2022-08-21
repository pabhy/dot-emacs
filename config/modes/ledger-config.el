;;; ledger-config.el --- Ledger mode config -*- lexical-binding: t -*-

;; Author: Pratik Abhyankar
;; Maintainer: Pratik Abhyankar
;; Version: 1.0
;; Package-Requires: (dependencies)
;; Homepage: homepage
;; Keywords: ledger, ledger-mode, ledger-code


;;; Commentary:
;; Ledger is a double entry accounting system, and 'ledger-mode' ports it to
;; Emacs.

;;; Code:
(use-package ledger-mode
  :init
  (setq ledger-clear-whole-transactions t))

(use-package flycheck-ledger
  :after flycheck ledger-mode)

(provide 'ledger-config)
;;; ledger-config.el ends here.
