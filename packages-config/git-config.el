;; Practical key bindings
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x M-g") 'magit-dispatch)

;; Set magit buffer in full frame
(setq magit-display-buffer-function #'magit-display-buffer-fullframe-status-v1)
(setq projectile-switch-project-action 'magit-status)
