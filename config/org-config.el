(setq org-directory ORG-DIR)

(setq-default
 org-hide-leading-stars t                  ;; Hide leading stars
 org-hide-emphasis-markers t               ;; Hide the Org markup indicators
 org-startup-indented t                    ;; Auto indent the body under headlines
 org-cycle-separator-lines 1               ;; Leave a line between org items
 org-src-fontify-natively t)               ;; Enable source code highlighting

(setq-default
 org-log-into-drawer t                     ;; Use LOGBOOK drawer to take notes
 org-log-done t                            ;; Add 'closed' log when marked done
 org-special-ctrl-a/e t                    ;; C-{a,e} should behave differently on headings
 org-enforce-todo-dependencies t           ;; Enforce tasks should be completed in order
 org-enforce-todo-checkbox-dependencies t) ;; Enforce checklist items should be completed in order

(setq-default
 org-agenda-max-entries 10                 ;; Show at max 10 entries from my agenda
 org-agenda-dim-blocked-tasks nil          ;; highlights blocked tasks
 org-agenda-skip-scheduled-if-done t       ;; No need to honor schedule if the task is already done
 org-agenda-block-separator)               ;; Add a line to separate agenda items in dinstint sections

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
      '(("ASSIGNED" . "#dc322f")
        ("IMPLEMENTATION" . "#b58900")
        ("BLOCKED" . "#cb4b16")
        ("WAITING" . "#cb4b16")
        ("REVIEW" . "#2aa198")
        ("RELEASE" . "#268bd2")
        ("DELEGATED" . "#859900")
        ("DONE" . "#859900")))

(use-package org-superstar
  :config
  (org-superstar-mode t))

(use-package org-journal
  :init
  (setq org-journal-prefix-key "C-c j")
  :config
  (setq org-journal-dir (expand-file-name "journal/" org-directory)
        org-journal-file-type 'daily
        org-journal-date-format "%A, %d %B %Y"))

(use-package org-roam
  :init
  (setq org-roam-directory ORG-ROAM-DIR
				org-roam-db-location ORG-ROAM-DB)
  :config
  (org-roam-db-autosync-mode))

(bind-key "C-c a" 'org-agenda)
(bind-key "C-c c" 'org-capture)
(bind-key "C-c i b" 'org-indent-block)     ;; Handy keybinding to indent my 'org-blocks' in config

(provide 'org-config)
