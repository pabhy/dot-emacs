(unless (file-exists-p CUSTOM-FILE)
  (with-temp-buffer (write-file CUSTOM-FILE)))
(setq custom-file CUSTOM-FILE)
(load-file custom-file)

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

(set-face-attribute 'default nil :height (if IS-MAC 150 110))
(when (member "Fira Code" (font-family-list))
	(set-frame-font "Fira Code"))

(use-package doom-modeline
  :init (doom-modeline-mode)
  :config
  (setq doom-modeline-enable-word-count t
        doom-modeline-indent-info t
				doom-modeline-height 15)
  (doom-modeline-def-modeline 'main
    '(bar matches buffer-info remote-host buffer-position parrot selection-info)
    '(misc-info minor-modes word-count battery lsp indent-info input-method buffer-encoding major-mode process vcs checker "  ")))

;; I have tweaked the original version and use my own forked version of Solarized theme.
(straight-use-package
 '(solarized-emacs :type git :host github :repo "pratik-abhyankar/solarized-emacs"))
(require 'solarized)
(setq
 x-underline-at-descent-line nil
 solarized-scale-markdown-headlines t
 solarized-use-variable-pitch nil)
(load-theme 'solarized-light-high-contrast t)

(setq active-theme 'solarized-light-high-contrast)
(defun toggle-dark-light-theme ()
  "Toggle between dark and light mode theme."
  (interactive)
  (if (eq active-theme 'solarized-light-high-contrast)
      (setq active-theme 'solarized-dark-high-contrast)
    (setq active-theme 'solarized-light-high-contrast))
  (load-theme active-theme t))
(bind-key "C-x c" 'toggle-dark-light-theme)

(provide 'appearance)
