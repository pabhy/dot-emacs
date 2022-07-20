(use-package magit
  :bind ("C-x g" . magit-status))

(use-package transient
  :config (setq transient-levels-file TRANSIENT-LEVELS-FILE
                transient-values-file TRANSIENT-VALUES-FILE
                transient-history-file TRANSIENT-HISTORY-FILE))

(use-package git-gutter
  :config
  (global-git-gutter-mode t))

(use-package projectile
  :config
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (setq projectile-completion-system 'ivy)
  (setq projectile-cache-file PROJECTILE-BOOKMARKS-FILE
        projectile-known-projects-file PROJECTILE-KNOWN-PROJECTS-FILE)
  (add-to-list 'projectile-project-root-files-bottom-up "pubspec.yaml")
  (add-to-list 'projectile-project-root-files-bottom-up "BUILD")
  (projectile-mode t))

(use-package counsel-projectile
  :after projectile counsel
  :bind ("C-x f" . counsel-projectile-find-file)
  :config
  (counsel-projectile-mode t))

(use-package treemacs
  :config
  (treemacs-project-follow-mode t)
  (treemacs-follow-mode t)
  (treemacs-git-mode 'extended)
  (treemacs-filewatch-mode t)
  (treemacs-indent-guide-mode t)
  (treemacs-resize-icons 16)
  :bind(("M-0" . treemacs-select-window)
        ("C-M-0" . treemacs)))

(use-package treemacs-projectile
  :after projectile treemacs)

(use-package treemacs-magit
  :after treemacs magit)

(use-package lsp-mode
  :init
  (setq lsp-server-install-dir LSP-DIR)
  (setq lsp-session-file LSP-SESSION-FILE)
  :hook ((lsp-mode . lsp-enable-which-key-integration)
         (java-mode . lsp-deferred)
         (rust-mode . lsp-deferred)
         (python-mode . lsp-deferred)
         (web-mode . lsp-deferred)
         (go-mode . lsp-deferred)
         (elixir-mode . lsp-deferred)
         (json-mode . lsp-deferred)
         (markdown-mode . lsp-deferred)
         (svelte-mode . lsp-deferred))
  :commands (lsp lsp-deferred)
  :config
  (define-key lsp-mode-map (kbd "C-c l") lsp-command-map))

(use-package lsp-ui
  :commands lsp-ui-mode)

(use-package lsp-ivy
  :commands lsp-ivy-workspace-symbol)

(use-package dap-mode
	:config (dap-auto-configure-mode))

(unless (and (executable-find "cmake") (executable-find "libtool"))
  (when IS-LINUX
    (async-shell-command "sudo -S apt install cmake libtool libtool-bin"))
  (when IS-MAC
    (async-shell-command "brew install cmake libtool libtool-bin")))
(use-package vterm)

(use-package yasnippet
  :init
  :config
  (setq yas-snippet-dirs (list YASNIPPETS-DIR))
  (yas-global-mode t))

(use-package yasnippet-snippets
  :config
  (add-to-list 'yas-snippet-dirs yasnippet-snippets-dir))

(provide 'dev)
