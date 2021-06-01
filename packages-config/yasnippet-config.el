(use-package yasnippet
  :config
  ;; Activate yasnippet with major modes
  ;; See https://github.com/joaotavora/yasnippet#use-yas-minor-mode-on-a-per-buffer-basis
  (yas-reload-all)
  :hook
  (c++-mode . yas-minor-mode)
  )

(use-package yasnippet-snippets)
