(use-package dashboard
  :config
  (dashboard-setup-startup-hook)
  )

(setq dashboard-items '((projects . 3)
                        (recents  . 5)
                        (agenda . 5)
                        (registers . 5)))
