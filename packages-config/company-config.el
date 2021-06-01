(use-package company
  :config
  ;; Use company in all buffer: https://company-mode.github.io/
  (add-hook 'after-init-hook 'global-company-mode)
  )

(use-package company-box
  :hook (company-mode . company-box-mode))
