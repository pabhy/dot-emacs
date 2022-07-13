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
