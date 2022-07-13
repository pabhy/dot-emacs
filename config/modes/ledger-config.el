(unless (executable-find "ledger")
  (when IS-LINUX
    (async-shell-command "sudo -S apt install ledger"))
  (when IS-MAC
    (async-shell-command "brew install ledger")))
(use-package ledger-mode
  :init
  (setq ledger-clear-whole-transactions t))

(use-package flycheck-ledger
  :after flycheck ledger-mode)

(provide 'ledger-config)
