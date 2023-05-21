;;; bootstrap.el --- Bootstrap Emacs config -*- lexical-binding: t -*-

;; Author: Pratik Abhyankar
;; Maintainer: Pratik Abhyankar
;; Version: 1.0
;; Package-Requires: (dependencies)
;; Homepage: homepage
;; Keywords: bootstrap, better defaults


;;; Commentary:
;; Bootstraps Emacs startup with better defaults and a package manager.


;;; Code:

;; Bootstrap code for downloading and setting up 'straight.el' package manager.
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/master/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; Make 'use-package' macro use 'straight.el' under the hood.
(straight-use-package 'use-package)
(use-package straight
  :custom (straight-use-package-by-default t))
(setq use-package-always-ensure t)

;; Sensible defaults is a collection of better default functions and keybindings.
(straight-use-package
 '(sensible-defaults :type git :host github :repo "hrs/sensible-defaults.el"))
(load-file "~/.emacs.d/straight/build/sensible-defaults/sensible-defaults.el")
(sensible-defaults/use-all-settings)
(sensible-defaults/use-all-keybindings)

;; Change the default appearance of Emacs frames.
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(setq default-frame-alist
      (append (list
               '(vertical-scroll-bars . nil)
               '(internal-border-width . 15)
               '(left-fringe    . 1)
               '(right-fringe   . 1)
               '(tool-bar-lines . 0)
               '(menu-bar-lines . 0))))

;; Clear the clutter from Emacs frame.
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(blink-cursor-mode -1)
(setq-default inhibit-startup-screen t
              initial-scratch-message ""
              frame-title-format '("%b [%m]"))
(setq-default line-spacing 0.3)
(setq x-underline-at-descent-line t)
(display-battery-mode)



;; set the default encoding system
(prefer-coding-system 'utf-8)
(setq default-file-name-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-language-environment 'utf-8)
(setq locale-coding-system 'utf-8)

;; Treat clipboard input as UTF-8 string first; compound text next, etc.
(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))

;; It's annoying to me that Emacs makes a sound everytime on error or shows a visual
;; bell.
(setq visible-bell t)
(setq ring-bell-function 'ignore)

;; Split windows vertically right and show a clean divider.
(setq window-divider-default-places 'right-only)
(window-divider-mode 1)

;; Make Emacs a better code editor as well as a text editor.
(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(add-hook 'prog-mode-hook 'column-number-mode)
(setq font-lock-maximum-decoration t)
(setq require-final-newline t
      scroll-preserve-screen-position t)
(global-hl-line-mode t)

;; Default line break behavior.
(setq-default fill-column 80)
(turn-on-auto-fill)

;; Tab settings.
(setq-default
 tab-always-indent t
 indent-tabs-mode nil
 indent-line-function 'insert-tab
 tab-width 2)

;; I don't want autosave and backup files that Emacs creates.
(setq-default
 auto-save-default nil
 auto-save-list-file-prefix nil
 make-backup-files nil
 create-lockfiles nil)

;; Open buffers from previous session by default when I start Emacs.
(setq-default desktop-dirname (concat user-emacs-directory "custom/"))
(desktop-save-mode 1)

;; Kill and yank settings. I override how kill ring functions in
;; `user-config.el' file according to my personal preference.
(setq-default
 select-enable-clipboard t
 mouse-yank-at-point t
 kill-whole-line t)

;; Default completion settings.
(setq completion-ignore-case t)
(setq read-file-name-completion-ignore-case t)
(setq read-buffer-completion-ignore-case t)

;; Automatically switch focus to Help buffer whenever one opens, so that I can
;; easily close it by pressing 'q' when I am done taking help.
(setq-default help-window-select t)

;; Ignore buffers that start with '*' when switching buffers.
(set-frame-parameter (selected-frame) 'buffer-predicate
                     (lambda (buf) (not (string-match-p "^*" (buffer-name buf)))))

;; On Mac, Opton key is Super key.
(when IS-MAC
  (setq mac-option-modifier 'super))

;; Better default keybindings for better buffer and window management.
(bind-key "M-[" 'previous-buffer)
(bind-key "M-]" 'next-buffer)
(bind-key "M-o" 'other-window)
(bind-key "M-`" 'other-frame)
(bind-key "RET" 'newline-and-indent)
(bind-key "C-x k" 'kill-current-buffer)

;; Sync the sytem PATH variable with Emacs.
(use-package exec-path-from-shell
	:config
	(when (memq window-system '(mac ns x))
		(exec-path-from-shell-initialize))
	(when (daemonp)
		(exec-path-from-shell-initialize)))

;; I haven't used 'emacsclient' as much, but let's still start Emacs server, coz
;; why not?!
(server-start)

(provide 'bootstrap)
;;; bootstrap.el ends here.
