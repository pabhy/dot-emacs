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

;; (setq-default org-agenda-files (list WORK-ORG-FILE PERSONAL-ORG-FILE))

;; (setq org-archive-location ORG-ARCHIVE-LOC)

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

(use-package svg-tag-mode
  :init
  (defconst date-re "[0-9]\\{4\\}-[0-9]\\{2\\}-[0-9]\\{2\\}")
  (defconst time-re "[0-9]\\{2\\}:[0-9]\\{2\\}")
  (defconst day-re "[A-Za-z]\\{3\\}")
  (defconst day-time-re (format "\\(%s\\)? ?\\(%s\\)?" day-re time-re))

  (defun svg-progress-percent (value)
    (svg-image (svg-lib-concat
                (svg-lib-progress-bar (/ (string-to-number value) 100.0)
                                      nil :margin 0 :stroke 2 :radius 3 :padding 2 :width 11)
                (svg-lib-tag (concat value "%")
                             nil :stroke 0 :margin 0)) :ascent 'center))

  (defun svg-progress-count (value)
    (let* ((seq (mapcar #'string-to-number (split-string value "/")))
           (count (float (car seq)))
           (total (float (cadr seq))))
      (svg-image (svg-lib-concat
                  (svg-lib-progress-bar (/ count total) nil
                                        :margin 0 :stroke 2 :radius 3 :padding 2 :width 11)
                  (svg-lib-tag value nil
                               :stroke 0 :margin 0)) :ascent 'center)))

  (setq svg-tag-tags
        `(
          ;; Org tags
          (":\\([A-Za-z0-9]+\\)" . ((lambda (tag) (svg-tag-make tag))))
          (":\\([A-Za-z0-9]+[ \-]\\)" . ((lambda (tag) tag)))

          ;; Task priority
          ("\\[#[A-Z]\\]" . ( (lambda (tag)
                                (svg-tag-make tag :face 'org-priority
                                              :beg 2 :end -1 :margin 0))))

          ;; Progress
          ("\\(\\[[0-9]\\{1,3\\}%\\]\\)" . ((lambda (tag)
                                              (svg-progress-percent (substring tag 1 -2)))))
          ("\\(\\[[0-9]+/[0-9]+\\]\\)" . ((lambda (tag)
                                            (svg-progress-count (substring tag 1 -1)))))

          ;; TODO / DONE
          ("TODO" . ((lambda (tag) (svg-tag-make "TODO" :face 'org-todo :inverse t :margin 0))))
          ("DONE" . ((lambda (tag) (svg-tag-make "DONE" :face 'org-done :margin 0))))


          ;; Citation of the form [cite:@Knuth:1984]
          ("\\(\\[cite:@[A-Za-z]+:\\)" . ((lambda (tag)
                                            (svg-tag-make tag
                                                          :inverse t
                                                          :beg 7 :end -1
                                                          :crop-right t))))
          ("\\[cite:@[A-Za-z]+:\\([0-9]+\\]\\)" . ((lambda (tag)
                                                     (svg-tag-make tag
                                                                   :end -1
                                                                   :crop-left t))))


          ;; Active date (with or without day name, with or without time)
          (,(format "\\(<%s>\\)" date-re) .
           ((lambda (tag)
              (svg-tag-make tag :beg 1 :end -1 :margin 0))))
          (,(format "\\(<%s \\)%s>" date-re day-time-re) .
           ((lambda (tag)
              (svg-tag-make tag :beg 1 :inverse nil :crop-right t :margin 0))))
          (,(format "<%s \\(%s>\\)" date-re day-time-re) .
           ((lambda (tag)
              (svg-tag-make tag :end -1 :inverse t :crop-left t :margin 0))))

          ;; Inactive date  (with or without day name, with or without time)
          (,(format "\\(\\[%s\\]\\)" date-re) .
           ((lambda (tag)
              (svg-tag-make tag :beg 1 :end -1 :margin 0 :face 'org-date))))
          (,(format "\\(\\[%s \\)%s\\]" date-re day-time-re) .
           ((lambda (tag)
              (svg-tag-make tag :beg 1 :inverse nil :crop-right t :margin 0 :face 'org-date))))
          (,(format "\\[%s \\(%s\\]\\)" date-re day-time-re) .
           ((lambda (tag)
              (svg-tag-make tag :end -1 :inverse t :crop-left t :margin 0 :face 'org-date))))))
  :hook
  (org-mode . svg-tag-mode))

(bind-key "C-c a" 'org-agenda)
(bind-key "C-c c" 'org-capture)
(bind-key "C-c i b" 'org-indent-block)


;; (use-package org-modern
;;   :hook
;;   (org-mode . org-modern-mode)
;;   (org-agenda-finalize . org-modern-agenda))

;; (use-package org-modern-indent
;;   :straight (org-modern-indent :type git :host github :repo "jdtsmith/org-modern-indent")
;;   :config
;;   (add-hook 'org-mode-hook #'org-modern-indent-mode 90))

(provide 'org-config)
;;; org-config.el ends here
