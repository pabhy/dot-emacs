(use-package which-key
  :ensure t
  :config
  (setq which-key-add-column-padding 1
        which-key-sort-uppercase-first nil
        which-key-show-early-on-C-h t
        which-key-idle-delay 1.0
        which-key-idle-secondary-delay 0.05)
  (which-key-mode))

(use-package ivy
  :config
  (ivy-mode t)
  (setq ivy-use-virtual-buffers t
        ivy-count-format "(%d/%d) "
        ivy-initial-inputs-alist nil
        enable-recursive-minibuffers t)
  :bind (("C-x b" . ivy-switch-buffer)
         ("C-x B" . ivy-switch-buffer-other-window)
         ("C-c C-r" . ivy-resume)))

(use-package swiper
  :bind (("C-s" . swiper-isearch)
         ("C-M-s" . isearch-forward-regexp)
         ("C-M-r" . isearch-backwards-regexp)))

(use-package counsel
  :bind (("C-x C-f" . counsel-find-file)
         ("C-c '" . counsel-imenu)
         ("C-c s" . counsel-rg)
         :map counsel-find-file-map
         ("RET" . ivy-alt-done)))

(use-package ivy-rich
  :init
  (setcdr (assq t ivy-format-functions-alist) #'ivy-format-function-line)
  (setq ivy-rich-path-style 'abbrev)
  :after counsel-projectile all-the-icons-ivy-rich
  :config
  (ivy-rich-mode t))

(use-package recentf
  :config
  (setq recentf-auto-cleanup 'never
        recentf-max-saved-items 50
        recentf-save-file RECENTF-FILE)
  (recentf-mode t)
  :bind("C-x C-r" . recentf-open-files))

(use-package amx
  :config
  (setq amx-save-file AMX-ITEMS-FILE)
  (amx-mode t))

(use-package company
  :bind (:map
         global-map
         ("TAB" . company-complete-common-or-cycle)
         :map company-active-map
         ("C-n" . company-select-next)
         ("C-p" . company-select-previous))
  :config
  (setq company-ide-delay 0.05
        company-minimum-prefix-length 1)
  (setq company-backends '((company-capf company-yasnippet company-dabbrev company-files)))
  (setq company-dabbrev-minimum-length 2
        company-dabbrev-other-buffers nil
        company-dabbrev-ignore-case t)
  (setq company-files-exclusions '(".git/" ".DS_Store"))
  (setq company-transformers '(delete-consecutive-dups
                             company-sort-by-occurrence))
  (global-company-mode t))

(use-package company-quickhelp
  :after company
  :init
  (setq company-quickhelp-delay 0.1)
  :config
  (company-quickhelp-mode))

(use-package company-statistics
  :config
  (company-statistics-mode))

(use-package ibuffer
  :bind ("C-x C-b" . ibuffer))
(require 'ibuf-ext)
(add-to-list 'ibuffer-never-show-predicates "^\\*")

(use-package ace-window
  :bind ("M-o" . ace-window))

(use-package flycheck
  :init (global-flycheck-mode))

(delete-selection-mode)
(electric-pair-mode 1)

(use-package undo-tree
  :config
  (setq undo-tree-history-directory-alist '(("." . "~/.emacs.d/custom/undo/")))
  (global-undo-tree-mode t))

(use-package ws-butler
  :config
  (ws-butler-global-mode t))

(use-package expand-region
  :bind ("C-=" . er/expand-region))

(use-package avy
  :bind (("C-;" . avy-goto-char)
         ("C-:" . avy-goto-line)))

(provide 'core)
