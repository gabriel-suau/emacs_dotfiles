(use-package treemacs
  :defer t
  :config
  ;; From https://github.com/Alexander-Miller/treemacs#faq
  ;; Avoid showing files not tracked by git.
  (with-eval-after-load 'treemacs
    (add-to-list 'treemacs-pre-file-insert-predicates #'treemacs-is-file-git-ignored?))
  :bind
  (("C-c n" . treemacs)
   ("C-c m" . treemacs-select-window))
)

(use-package treemacs-projectile
  :after treemacs projectile)

(use-package treemacs-icons-dired
  :after treemacs dired
  :config (treemacs-icons-dired-mode))

(use-package treemacs-magit
  :after treemacs magit)
