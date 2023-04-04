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

(provide 'constants)
;;; constants.el ends here
