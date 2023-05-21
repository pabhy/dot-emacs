;;; org-config.el --- Org-mode config for Emacs -*- lexical-binding: t -*-

;; Author: Pratik Abhyankar
;; Maintainer: Pratik Abhyankar
;; Version: 1.0
;; Package-Requires: (dependencies)
;; Homepage: homepage
;; Keywords: org, org-mode


;;; Commentary:


;;; Code:
(setq org-directory "~/org")

(setq-default
 org-agenda-block-separator ?-             ;; Add a line to separate agenda items in dinstint sections
 org-agenda-dim-blocked-tasks nil          ;; highlights blocked tasks
 org-agenda-max-entries 10                 ;; Show at max 10 entries from my agenda
 org-agenda-skip-scheduled-if-done t       ;; No need to honor schedule if the task is already done
 org-auto-align-tags t                     ;; Align the tags automatically
 org-cycle-separator-lines 1               ;; Leave a line between org items
 org-enforce-todo-checkbox-dependencies t  ;; Enforce checklist items should be completed in order
 org-enforce-todo-dependencies t           ;; Enforce tasks should be completed in order
 org-hide-emphasis-markers t               ;; Hide the Org markup indicators
 org-hide-leading-stars t                  ;; Hide leading stars
 org-insert-heading-respect-content t      ;; Create Org header in the current subtree
 org-log-into-drawer t                     ;; Use LOGBOOK drawer to take notes
 org-pretty-entities t                     ;; Show UTF entities
 org-special-ctrl-a/e t                    ;; C-{a,e} should behave differently on headings
 org-src-fontify-natively t                ;; Enable source code highlighting
 org-startup-indented t                    ;; Auto indent the body under headlines
 org-list-demote-modify-bullet '(("+" . "-") ("-" . "+")))

(add-hook 'org-mode-hook 'turn-on-flyspell)


(setq org-todo-keywords
      '((sequence "ASSIGNED(a)"
                  "IMPLEMENTATION(i)"
                  "BLOCKED(b)"
                  "WAITING(w)"
                  "REVIEW(r)"
                  "RELEASE(e)"
                  "|"
                  "DELEGATED(l)"
                  "DONE(d)")))

(setq org-todo-keyword-faces
      '(("ASSIGNED" . "#c9b4cf")
        ("IMPLEMENTATION" . "#f0c674")
        ("BLOCKED" . "#cc6666")
        ("WAITING" . "#dd9955")
        ("REVIEW" . "#81a2be")
        ("RELEASE" . "#8abeb7")
        ("DELEGATED" . "#5a5a5a")
        ("DONE" . "#b5bd68")))

(bind-key "C-c a" 'org-agenda)
(bind-key "C-c c" 'org-capture)
(bind-key "C-c i b" 'org-indent-block)

(use-package org-superstar
  :config
  (add-hook 'org-mode-hook (lambda () (org-superstar-mode 1))))

(provide 'org-config)
;;; org-config.el ends here
