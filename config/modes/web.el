(use-package web-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.svelte?\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.css?\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.scss?\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.js?\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.jsx?\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.json?\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.xml?\\'" . web-mode))
  (setq web-mode-markup-indent-offset 2
        web-mode-css-indent-offset 2
        web-mode-code-indent-offset 2
        web-mode-enable-auto-pairing t
        web-mode-enable-css-colorization t
        web-mode-enable-block-face t
        web-mode-enable-comment-interpolation t
        web-mode-enable-current-element-highlight t
        web-mode-enable-current-column-highlight t))

(use-package emmet-mode
  :hook
  (sgml-mode-hook . emmet-mode)
  (css-mode-hook . emmet-mode)
  (web-mode-hook . emmet-mode)
  :config
  (setq emmet-move-cursor-between-quotes t))
