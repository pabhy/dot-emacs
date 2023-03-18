;;; core.el --- Code Emacs config -*- lexical-binding: t -*-

;; Author: Pratik Abhyankar
;; Maintainer: Pratik Abhyankar
;; Version: 1.0
;; Package-Requires: (dependencies)
;; Homepage: homepage
;; Keywords: core, company, completion, ivy, ibuffer


;;; Commentary:
;; Adds core functionalities to Emacs which makes it so good. Better completion,
;; search and window management.

;;; Code:

;; Prompts the next possible keystroke after a prefix key.
(use-package which-key
  :custom
  (which-key-add-column-padding 1)
  (which-key-sort-uppercase-first nil)
  (which-key-show-early-on-C-h t)
  (which-key-idle-delay 1.0)
  (which-key-idle-secondary-delay 0.05)
  :config
  (which-key-mode))

;; Improve Emacs minibuffer completion and search.
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
         ("M-x" . counsel-M-x)
         ("C-h v" . counsel-describe-variable)
         ("C-h f" . counsel-describe-function)
         ("C-x C-r" . counsel-recentf)
         :map counsel-find-file-map
         ("RET" . ivy-alt-done)))

(use-package ivy-rich
  :init
  (setcdr (assq t ivy-format-functions-alist) #'ivy-format-function-line)
  :custom
  (ivy-rich-path-style 'abbrev)
  :after ivy all-the-icons-ivy-rich
  :config
  (ivy-rich-mode 1))

(use-package ivy-posframe
  :custom
  (ivy-posframe-border-width 10)
  (ivy-posframe-display-functions-alist
   '((complete-symbol . ivy-posframe-display-at-point)
     (swiper . ivy-display-function-fallback)
     (swiper-isearch . ivy-display-function-fallback)
     (counsel-rg . ivy-display-function-fallback)
     (t . ivy-posframe-display-at-frame-top-center)))
  :config
  (ivy-posframe-mode t))


;; Remembers the most receently opened files.
(use-package recentf
  :custom
  (recentf-auto-cleanup 'never)
  (recentf-max-saved-items 50)
  (recentf-save-file (pratik/set-custom-file "recentf"))
  :config
  (recentf-mode t))

;; Show most recently used functions at the top.
(use-package amx
  :custom
  (amx-save-file (pratik/set-custom-file "amx-items"))
  :config
  (amx-mode t))

;; Heart of Emacs. Completion framework for Emacs.
(use-package company
  :bind (:map
         global-map
         ("s-<tab>" . company-complete-common-or-cycle)
         :map company-active-map
         ("C-n" . company-select-next)
         ("C-p" . company-select-previous))
  :custom
  (company-ide-delay 0.05)
  (company-minimum-prefix-length 1)
  (company-backends '((company-capf company-yasnippet company-dabbrev company-files)))
  (company-dabbrev-minimum-length 2)
  (company-dabbrev-other-buffers t)
  (company-dabbrev-ignore-case t)
  (company-dabbrev-downcase nil)
  (company-files-exclusions '(".git/" ".DS_Store"))
  (company-transformers '(delete-consecutive-dups
                          company-sort-by-occurrence))
  :config
  (global-company-mode t))

(use-package company-quickhelp
  :after company
  :init
  (setq company-quickhelp-delay 0.1)
  :config
  (company-quickhelp-mode))

(use-package company-statistics
  :custom
  (company-statistics-file (pratik/set-custom-file "company-statistics-cache.el"))
  :config
  (company-statistics-mode))

;; Better buffer and window management
(use-package ibuffer
  :bind ("C-x C-b" . ibuffer))
(require 'ibuf-ext)
(add-to-list 'ibuffer-never-show-predicates "^\\*")

(use-package dumb-jump
  :init
  (setq xref-show-definitions-function #'xref-show-definitions-completing-read)
  :hook
  ;; Allow using default xref with 'M-.' to use dumb-jump.
  (xref-backend-functions . dumb-jump-xref-activate))

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

(use-package move-text
  :config
  (defun indent-region-advice (&rest ignored)
    (let ((deactivate deactivate-mark))
      (if (region-active-p)
          (indent-region (region-beginning) (region-end))
        (indent-region (line-beginning-position) (line-end-position)))
      (setq deactivate-mark deactivate)))
  (advice-add 'move-text-up :after 'indent-region-advice)
  (advice-add 'move-text-down :after 'indent-region-advice)
  (move-text-default-bindings))

(use-package avy
  :bind (("C-;" . avy-goto-char)
         ("C-:" . avy-goto-line)))

(provide 'core)
;;; core.el ends here
