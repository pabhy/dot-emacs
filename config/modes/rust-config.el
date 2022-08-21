;;; rust-config.el --- Rust mode config -*- lexical-binding: t -*-

;; Author: Pratik Abhyankar
;; Maintainer: Pratik Abhyankar
;; Version: 1.0
;; Package-Requires: (dependencies)
;; Homepage: homepage
;; Keywords: rust, rust-mode, rust-config

;;; Commentary:

;;; Code:
(use-package rust-mode
  :config
  (setq rust-format-on-save t)
(shell-command "rustup component add rustfmt")
(shell-command "rustup component add rls")
(add-to-list 'exec-path "~/.cargo/bin"))

(use-package tree-sitter
  :config
  (require 'tree-sitter-langs)
  (global-tree-sitter-mode)
  :hook
  (tree-sitter-after-on-hook . tree-sitter-hl-mode))

(use-package cargo
  :hook
  (rust-mode . cargo-minor-mode)
  :config
  (define-key cargo-mode-map (kbd "C-c C-x") 'cargo-minor-mode-command-map))

(provide 'rust-config)
;;; rust-config.el ends here.
