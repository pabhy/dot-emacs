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


;; I do not like Emacs's default behavior of copying the deleted word or line to
;; the kill ring. Referring to
;; http://xahlee.info/emacs/emacs/emacs_kill-ring.html I customize the default
;; behavior to delete instead of kill.
(defun pratik/delete-word (arg)
  "Delete ARG forward until encountering the end of a word.
With argument, do this that many times. This command does not
push text to `kill-ring'."
  (interactive "p")
  (delete-region
   (point)
   (progn
     (forward-word arg)
     (point))))

(defun pratik/backward-delete-word (arg)
  "Delete ARG backward until encountering the beginning of a word.
With argument, do this that many times.
This command does not push text to `kill-ring'."
  (interactive "p")
  (pratik/delete-word (- arg)))

(defun pratik/delete-line ()
  "Delete text from current position to end of line char.
This command does not push text to `kill-ring'."
  (interactive)
  (delete-region
   (point)
   (progn (end-of-line 1) (point)))
  (delete-char 1))

(defun pratik/delete-line-backward ()
  "Delete text between the beginning of the line to the cursor position.
This command does not push text to `kill-ring'."
  (interactive)
  (let (p1 p2)
    (setq p1 (point))
    (beginning-of-line 1)
    (setq p2 (point))
    (delete-region p1 p2)))

(bind-key "M-d" 'pratik/delete-word)
(bind-key "<M-backspace>" 'pratik/backward-delete-word)
(bind-key "C-k" 'pratik/delete-line)
(bind-key "<C-M-backspace>" 'pratik/delete-line-backward)

(provide 'user-config)
;;; user-config.el ends here
