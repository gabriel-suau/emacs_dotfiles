(use-package org
  :bind (("C-c c" . org-capture)
         ("C-c l" . org-store-link)
         ("C-c a" . org-agenda))
  :hook (org-mode . auto-fill-mode)
  )
