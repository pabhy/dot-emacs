;;; web-config.el --- Web development config for Emacs -*- lexical-binding: t -*-

;; Author: Pratik Abhyankar
;; Maintainer: Pratik Abhyankar
;; Version: 1.0
;; Package-Requires: (dependencies)
;; Homepage: homepage
;; Keywords: web, js, javascript, jsx, vue, react, svelte, json, html, css, emmet


;;; Commentary:
;; This file adds web development related config to Emacs. Completion, font
;; locking, indentation and formatting for most of the web languages and
;; frameworks is efficiently handled by the the 'web-mode' package. This file
;; also adds 'emmet' and 'json' modes to Emacs.

;;; Code:
(use-package web-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.svelte?\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.css?\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.scss?\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.js?\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.jsx?\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.json?\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.xml?\\'" . web-mode))
  (setq web-mode-markup-indent-offset 2
        web-mode-css-indent-offset 2
        web-mode-code-indent-offset 2
        web-mode-enable-auto-pairing t
        web-mode-enable-css-colorization t
        web-mode-enable-block-face t
        web-mode-enable-comment-interpolation t
        web-mode-enable-current-element-highlight t
        web-mode-enable-current-column-highlight t))

(use-package emmet-mode
  :hook
  (css-mode-hook . emmet-mode)
  (web-mode-hook . emmet-mode)
  :config
  (setq emmet-move-cursor-between-quotes t))

(unless (and (executable-find "node") (executable-find "npm"))
	(shell-command "wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | zsh")
	(shell-command "nvm install node")
	(shell-command "npm install -g typescript"))

(provide 'web-config)
;;; web-config.el ends here.
