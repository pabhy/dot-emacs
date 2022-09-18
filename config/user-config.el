;;; user-config.el --- Loads the Emacs user's custom config -*- lexical-binding: t -*-

;; Author: Pratik Abhyankar
;; Maintainer: Pratik Abhyankar
;; Version: version
;; Package-Requires: (dependencies)
;; Homepage: homepage
;; Keywords: keywords

;;; Commentary:

;;; Code:

;; Set my name and email.
(setq user-full-name "Pratik Abhyankar")
(setq user-mail-address "abhyankar.pratik.5@gmail.com")

;; My custom file keybindings
(pratik/add-file-keybinding "C-c z r" (expand-file-name "personal/reading-list.org" org-directory) "Reading List")
(pratik/add-file-keybinding "C-c z g" (expand-file-name "personal/grooming.org" org-directory) "Grooming")
(pratik/add-file-keybinding "C-c z i" (expand-file-name "personal/ideas.org" org-directory) "Ideas")
(pratik/add-file-keybinding "C-c z p" (expand-file-name "personal/personal.org" org-directory) "Personal")
(pratik/add-file-keybinding "C-c z t" (expand-file-name "personal/fitness.org" org-directory) "Fitness")
(pratik/add-file-keybinding "C-c z w" (expand-file-name "work/work.org" org-directory) "Work")
(pratik/add-file-keybinding "C-c z f" (expand-file-name "work/feedback.org" org-directory) "Feedback")

;; Automatically creates a new ledger file every month, and a ledger directory
;; every new year and assigns a hotkey binding to open the current ledger file.
(defvar pratik/accounting-directory "~/accounting")
(defvar pratik/accounting-ledgers-directory "ledgers/")
(defvar pratik/accounting-reports-directory "reports/")
(pratik/add-file-keybinding "C-c z l" (expand-file-name
																			 (concat (format-time-string "%Y/")
																							 pratik/accounting-ledgers-directory
																							 (downcase (format-time-string "%B.ledger")))
																			 pratik/accounting-directory) "Ledger")

(provide 'user-config)
;;; user-config.el ends here
