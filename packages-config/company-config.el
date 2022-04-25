(use-package company
  :config
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 1)
  (setq company-selection-wrap-around t)
  ;; Use company in all buffer: https://company-mode.github.io/
  (add-hook 'after-init-hook 'global-company-mode)
  )

(use-package company-jedi
  :config
  (defun company-python-hook()
    (add-to-list `company-backends `company-jedi))
  (add-hook `python-mode-hook `company-python-hook)
  (add-hook 'python-mode-hook 'jedi:setup)
  (add-hook 'python-mode-hook 'company-python-hook)
  ;; (setq jedi:complete-on-dot t)
  )

(use-package company-box
  :hook (company-mode . company-box-mode))
