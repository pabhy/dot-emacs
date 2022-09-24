;;; constants.el --- Defines all required constants for the Emacs config -*- lexical-binding: t -*-

;; Author: Pratik Abhyankar
;; Maintainer: Pratik Abhyankar
;; Version: 1.0
;; Package-Requires: (dependencies)
;; Homepage: homepage
;; Keywords: constants

;;; Commentary:


;;; Code:

;; Define constants to identify system type
(defconst NATIVECOMP (if (fboundp 'native-comp-available-p) (native-comp-available-p)))
(defconst EMACS28+   (> emacs-major-version 27))
(defconst EMACS29+   (> emacs-major-version 28))
(defconst IS-MAC     (eq system-type 'darwin))
(defconst IS-LINUX   (eq system-type 'gnu/linux))
(defconst IS-WINDOWS (memq system-type '(cygwin windows-nt ms-dos)))
(defconst IS-BSD     (or IS-MAC (eq system-type 'berkeley-unix)))

;; Define file and directory path constants.
(defconst ORG-DIR "~/org/")
(unless (file-directory-p ORG-DIR)
  (make-directory ORG-DIR))
(defconst WORK-ORG-FILE (expand-file-name "work/work.org" ORG-DIR))
(defconst PERSONAL-ORG-FILE (expand-file-name "personal/personal.org" ORG-DIR))
(defconst ORG-ARCHIVE-LOC (concat ORG-DIR "archive/" "%s_archive::"))
(defconst ORG-ROAM-DIR-NAME "roam/")
(defconst ORG-ROAM-DIR (expand-file-name (concat ORG-DIR ORG-ROAM-DIR-NAME)))
(unless (file-directory-p ORG-ROAM-DIR)
  (make-directory ORG-ROAM-DIR))
(defconst ORG-ROAM-DB (expand-file-name "org-roam.db" ORG-ROAM-DIR))

(provide 'constants)
;;; constants.el ends here
