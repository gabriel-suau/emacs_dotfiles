(use-package flycheck
  :init (global-flycheck-mode)
  :config
  (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc))
  ;; From https://www.flycheck.org/en/latest/user/quickstart.html#enable-flycheck
  (add-hook 'after-init-hook #'global-flycheck-mode)
  ;; A checker is automatically disabled if more than 1000 errors reported
  (setq flycheck-checker-error-threshold 1000)
  )
