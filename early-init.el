;;; early-init.el --- Early init load config for Emacs -*- lexical-binding: t -*-

;; Author: Pratik Abhyankar
;; Maintainer: Pratik Abhyankar
;; Version: 1.0
;; Package-Requires: (dependencies)
;; Homepage: homepage
;; Keywords: early-init, early-init.el


;;; Commentary:
;; Loads the early-init config for Emacs. Primarily used to disable package.el
;; since the config uses straigh.el to manage Emacs packages.

;;; Code:

;; Disable the built in package.el package manager. The config will use straight.el instead.
(setq package-enable-at-startup nil)

(provide 'early-init)
;;; early-init.el ends here.
