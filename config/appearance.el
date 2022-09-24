;;; appearance.el --- Look and feel config for Emacs -*- lexical-binding: t -*-

;; Author: Pratik Abhyankar
;; Maintainer: Pratik Abhyankar
;; Version: 1.0
;; Homepage: homepage
;; Keywords: appearance, look, look and feel, feel, theme, ui, font


;;; Commentary:
;; This Emacs config file contains config to polish the look and feel of Emacs.
;; It sets a theme, decorates the modeline and beautifies Emacs by adding icons.
;; This config also allows you to toggle between light and dark mode with `C-x c'
;; keybinding.


;;; Code:

;; Set a dedicate custom file for Emacs.
(defconst CUSTOM-FILE (pratik/set-custom-file "custom-file.el"))
(unless (file-exists-p CUSTOM-FILE)
  (with-temp-buffer (write-file CUSTOM-FILE)))
(setq custom-file CUSTOM-FILE)
(load-file custom-file)

;; Adds icons to a rather text based Emacs.
(use-package all-the-icons
  :if (display-graphic-p)
  :config
  (unless (member "all-the-icons" (font-family-list))
    (all-the-icons-install-fonts t))
  (setq inhibit-compacting-font-caches t
        all-the-icons-scale-factor 1.1))

(use-package all-the-icons-ibuffer
  :hook (ibuffer-mode . all-the-icons-ibuffer-mode)
  :after all-the-icons
  :config
  (setq all-the-icons-ibuffer-display-predicate #'display-graphic-p
        all-the-icons-ibuffer-color-icon t
        all-the-icons-ibuffer-icon t))

(use-package all-the-icons-ivy-rich
  :init
  (all-the-icons-ivy-rich-mode t)
  :config
  (setq all-the-icons-ivy-rich-project t
        all-the-icons-ivy-rich-color-icon t
        all-the-icons-ivy-rich-icon t))

;; Use 'FiraCode' on non-Mac devices. Otherwise keep the default 'Menlo' font.
(set-face-attribute 'default nil :height (if IS-MAC 150 110))
(when (member "Fira Code" (font-family-list))
	(set-frame-font "Fira Code"))

;; Setup a good theme and modeline. Make it easy to toggle between dark and
;; light modes.
(use-package doom-themes
  :config
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t)
  (load-theme 'doom-tomorrow-night t)
  (doom-themes-visual-bell-config)
  (setq doom-themes-treemacs-theme "doom-atom")
  (doom-themes-treemacs-config)
  (doom-themes-org-config))

(use-package doom-modeline
  :init (doom-modeline-mode)
  :config
  (setq doom-modeline-enable-word-count t
        doom-modeline-indent-info t
        doom-modeline-height 30)
  (doom-modeline-def-modeline 'main
    '(bar matches buffer-info remote-host buffer-position parrot selection-info)
    '(misc-info minor-modes word-count battery lsp indent-info input-method buffer-encoding major-mode process vcs checker "  ")))

(setq active-theme 'doom-tomorrow-night)
(defun toggle-dark-light-theme ()
  "Toggle between dark and light mode theme."
  (interactive)
  (if (eq active-theme 'doom-tomorrow-day)
      (setq active-theme 'doom-tomorrow-night)
    (setq active-theme 'doom-tomorrow-day))
  (load-theme active-theme t))
(bind-key "C-x c" 'toggle-dark-light-theme)

(provide 'appearance)
;;; appearance.el ends here
