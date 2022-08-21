;;; doc-config.el --- Documentation config for Emacs' -*- lexical-binding: t -*-

;; Author: Pratik Abhyankar
;; Maintainer: Pratik Abhyankar
;; Version: 1.0
;; Package-Requires: (dependencies)
;; Homepage: homepage
;; Keywords: doc, documentation, markdown, pdf, spellcheck

;;; Commentary:
;; Adds doc reading and writing capabilities to Emacs.


;;; Code:
(when IS-MAC
  (unless (executable-find "aspell")
    (async-shell-command "brew install aspell")))

(use-package spell-fu
  :config
  (setq spell-fu-directory SPELL-FU-DIR)
  (add-hook 'org-mode-hook
            (lambda ()
              (setq spell-fu-faces-exclude
                    '(org-block-begin-line
                      org-block-end-line
                      org-block
                      org-code
                      org-date
                      org-drawer org-document-info-keyword
                      org-ellipsis
                      org-link
                      org-meta-line
                      org-properties
                      org-properties-value
                      org-special-keyword
                      org-src
                      org-tag
                      org-verbatim))
              (spell-fu-mode)))
	:hook (tex-mode . spell-fu-mode))

(use-package define-word
  :bind ("C-c w" . define-word-at-point))

(use-package pdf-tools
  :mode ("\\.pdf\\'" . pdf-view-mode)
  :config
  (pdf-tools-install)
  (add-hook 'pdf-view-mode-hook (lambda () (display-line-numbers-mode -1)))
  (setq-default pdf-view-display-size 'fit-page))

(use-package markdown-mode
  :mode ("README\\.md\\'" . gfm-mode)
  :config
  (unless (executable-find "pandoc")
    (when IS-LINUX
      (async-shell-command "sudo -S apt install pandoc"))
    (when IS-MAC
      (async-shell-command "brew install pandoc")))
  (setq markdown-command "pandoc"))

(provide 'doc-config)
;;; doc-config.el ends here
