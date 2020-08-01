(use-package magit
  :defer t
  :hook
  ;; Automatically refresh magit status buffer on save.
  ;; See https://magit.vc/manual/magit/Automatic-Refreshing-of-Magit-Buffers.html#Automatic-Refreshing-of-Magit-Buffers
  (after-save . magit-after-save-refresh-status)
  :bind (("C-x g" . magit-status)
         ("C-x M-g" . magit-dispatch)))


(use-package evil-magit
  :defer t
  :requires magit)

(use-package gitignore-mode
  :defer t
  :requires magit)
