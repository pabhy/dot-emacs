;;; auxiliary.el --- Loads my custom helper functions -*- lexical-binding: t; -*-

;; Define a helper function to assign shortcut keys to 'find-file' frequently
;; used files. I use this to open this 'init.el' and other daily used 'org' files.
;; Adapted from https://zzamboni.org blog.
(defun pratik/add-file-keybinding (key file desc)
	"Assign KEY as binding to open FILE represented by an optional DESC."
	(let ((key key)
				(file file)
				(desc desc))
		(global-set-key (kbd key) (lambda () (interactive) (find-file file)))
		(which-key-add-key-based-replacements key (or desc file))))

(pratik/add-file-keybinding "C-c z d" (expand-file-name "diet.org" org-directory) "Diet Tracker")
(pratik/add-file-keybinding "C-c z r" (expand-file-name "reading-list.org" org-directory) "Reading List")

;; Automatically creates a new ledger file every month, and a ledger directory
;; every new year and assigns a hotkey binding to open the current ledger file.
(defvar pratik/accounting-directory "~/accounting")
(defvar pratik/accounting-ledgers-directory "ledgers/")
(defvar pratik/accounting-reports-directory "reports/")
(pratik/add-file-keybinding "C-c z l"(expand-file-name
																			(concat (format-time-string "%Y/")
																							pratik/accounting-ledgers-directory
																							(downcase (format-time-string "%B.ledger")))
																			pratik/accounting-directory) "Ledger")

(provide 'auxiliary)
;;; auxiliary.el ends here
