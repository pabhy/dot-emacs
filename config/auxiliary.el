;;; auxiliary.el --- Personalized helper functions -*- lexical-binding: t; -*-

;;; Commentary:
;; Loads my personalized helper functions to streamline my workflow in Emacs.

;;; Code:

;; Define a helper function to assign shortcut keys to 'find-file' frequently
;; used files. I use this to open this 'init.el' and other daily used 'org'
;; files. Adapted from https://zzamboni.org blog.
(defun pratik/add-file-keybinding (key file desc)
	"Assign KEY as binding to open FILE represented by an optional DESC."
	(let ((key key)
				(file file)
				(desc desc))
		(global-set-key (kbd key) (lambda () (interactive) (find-file file)))
		(which-key-add-key-based-replacements key (or desc file))))

(provide 'auxiliary)
;;; auxiliary.el ends here
