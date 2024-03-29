;;; flutter-config.el --- Flutter and Dart mode config -*- lexical-binding: t -*-

;; Author: Pratik Abhyankar
;; Maintainer: Pratik Abhyankar
;; Version: 1.0
;; Package-Requires: (dependencies)
;; Homepage: homepage
;; Keywords: flutter, dart, flutter-mode, dart-mode


;;; Commentary:


;;; Code:
(use-package dart-mode
  :custom
  (dart-format-on-save t))

(use-package lsp-dart
  :hook
  (dart-mode . lsp-deferred)
  :config
  (when IS-LINUX
    (setq lsp-dart-flutter-sdk-dir (concat (getenv "HOME") "/snap/flutter/common/flutter/"))
    (setq lsp-dart-sdk-dir (concat (getenv "HOME") "/snap/flutter/common/flutter/bin/cache/dart-sdk/")))
  (when IS-MAC
    (setq lsp-dart-flutter-sdk-dir (concat (getenv "HOME") "/flutter/"))
    (setq lsp-dart-sdk-dir (concat (getenv "HOME") "/flutter/bin/cache/dart-sdk/")))
  (setq lsp-dart-dap-flutter-hot-reload-on-save t)
  (setq lsp-dart-show-flutter-outline t))

(provide 'flutter-config)
;;; flutter-config.el ends here.
