(use-package svelte-mode)

(use-package json-mode)

(use-package emmet-mode
  :hook
  (sgml-mode-hook . emmet-mode)
  (html-mode-hook . emmet-mode)
  (css-mode-hook . emmet-mode)
  (svelte-mode-hook . emmet-mode)
  :config
  (setq emmet-move-cursor-between-quotes t))
