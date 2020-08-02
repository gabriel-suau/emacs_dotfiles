(use-package cc-mode
  :config
  ;; "*.h" are open with c-mode by default, make it c++-mode
  (add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
  (setq-default c-basic-offset 2)
  (setq-default fill-column 80)
  )

(use-package highlight-doxygen
  :hook
  ((c++-mode . highlight-doxygen-mode))
  )
